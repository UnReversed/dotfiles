{pkgs}: let
  inherit (pkgs) lib;

  sources = import ./sources.nix {inherit pkgs;};

  plugins = import ./plugins.nix {
    inherit pkgs;
    inherit
      (sources)
      version
      src
      pluginAksDesktopNpmDeps
      pluginAiAssistantNpmDeps
      insightsPluginTarball
      ;
  };

  headlampFrontend = import ./frontend.nix {
    inherit pkgs;
    inherit
      (sources)
      version
      src
      headlampFrontendNpmDeps
      ;
  };

  headlampApp = import ./app.nix {
    inherit pkgs;
    inherit
      (sources)
      version
      src
      headlampAppNpmDeps
      ;
  };
in
  pkgs.stdenvNoCC.mkDerivation {
    pname = "aks-desktop";
    inherit (sources) version src;

    nativeBuildInputs = with pkgs; [
      makeWrapper
      copyDesktopItems
    ];

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "aks-desktop";
        desktopName = "AKS Desktop";
        comment = "Application-focused experience for Azure Kubernetes Service";
        exec = "aks-desktop";
        icon = "aks-desktop";
        categories = [
          "Development"
        ];
        startupWMClass = "AKS desktop";
      })
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/lib/aks-desktop/app"
      mkdir -p "$out/lib/aks-desktop/resources"

      install -Dm644 ${headlampApp}/package.json "$out/lib/aks-desktop/app/package.json"
      cp -r ${headlampApp}/build "$out/lib/aks-desktop/app/"

      cp -r ${headlampApp}/node_modules "$out/lib/aks-desktop/app/"
      chmod -R u+w "$out/lib/aks-desktop/app/node_modules"
      rm -rf "$out/lib/aks-desktop/app/node_modules/.bin"

      mkdir -p "$out/lib/aks-desktop/resources/frontend"
      cp -r ${headlampFrontend}/. "$out/lib/aks-desktop/resources/frontend"

      mkdir -p "$out/lib/aks-desktop/resources/frontend/i18n"
      cp -r ${sources.src}/headlamp/frontend/src/i18n/locales "$out/lib/aks-desktop/resources/frontend/i18n/locales"

      mkdir -p "$out/lib/aks-desktop/resources/.plugins/aks-desktop"
      cp -r ${plugins.pluginAksDesktop}/dist/. "$out/lib/aks-desktop/resources/.plugins/aks-desktop/"
      cp ${plugins.pluginAksDesktop}/package.json "$out/lib/aks-desktop/resources/.plugins/aks-desktop/package.json"

      mkdir -p "$out/lib/aks-desktop/resources/.plugins/ai-assistant"
      cp -r ${plugins.pluginAiAssistant}/dist/. "$out/lib/aks-desktop/resources/.plugins/ai-assistant/"
      cp ${plugins.pluginAiAssistant}/package.json "$out/lib/aks-desktop/resources/.plugins/ai-assistant/package.json"

      mkdir -p "$out/lib/aks-desktop/resources/.plugins/insights-plugin"
      cp -r ${plugins.pluginInsights}/dist/. "$out/lib/aks-desktop/resources/.plugins/insights-plugin/"
      chmod -R u+w "$out/lib/aks-desktop/resources/.plugins/insights-plugin"
      cp ${plugins.pluginInsights}/package.json "$out/lib/aks-desktop/resources/.plugins/insights-plugin/package.json"

      mkdir -p "$out/lib/aks-desktop/resources/external-tools"
      cp ${sources.src}/headlamp/app/app-build-manifest.json "$out/lib/aks-desktop/resources/"
      cp ${sources.src}/headlamp/LICENSE "$out/lib/aks-desktop/resources/LICENSE"
      cp ${sources.src}/NOTICE.md "$out/lib/aks-desktop/resources/NOTICE.md"
      cp -r ${sources.src}/headlamp/app/assets "$out/lib/aks-desktop/resources/"

      ln -s ${pkgs.headlamp-server}/bin/headlamp-server "$out/lib/aks-desktop/resources/headlamp-server"

      cat > "$out/lib/aks-desktop/app/main.js" <<ENTRY
      const path = require('path');
      const { app } = require('electron');
      const resourcesPath = path.resolve(__dirname, '..', 'resources');
      Object.defineProperty(process, 'resourcesPath', {
        get: () => resourcesPath,
        configurable: false,
      });
      app.setVersion('${sources.version}');
      app.setName('AKS desktop');
      require('./build/main.js');
      ENTRY

      substituteInPlace "$out/lib/aks-desktop/app/package.json" \
        --replace-fail '"main": "build/main.js"' '"main": "main.js"'

      mkdir -p "$out/share/icons/hicolor/512x512/apps"
      cp ${sources.src}/headlamp/frontend/public/android-chrome-512x512.png "$out/share/icons/hicolor/512x512/apps/aks-desktop.png"

      mkdir -p "$out/bin"
      makeWrapper ${pkgs.electron}/bin/electron "$out/bin/aks-desktop" \
        --add-flags "$out/lib/aks-desktop/app" \
        --prefix PATH : ${pkgs.headlamp-server}/bin

      runHook postInstall
    '';

    meta = with lib; {
      description = "AKS Desktop assembled from builder-native component packages";
      homepage = "https://github.com/Azure/aks-desktop";
      license = licenses.asl20;
      sourceProvenance = [sourceTypes.fromSource];
      platforms = ["x86_64-linux" "aarch64-linux"];
      mainProgram = "aks-desktop";
      maintainers = [];
    };
  }
