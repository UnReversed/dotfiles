{pkgs}: let
  inherit (pkgs) lib stdenv;

  version = "0.9.1";

  src = pkgs.fetchgit {
    url = "https://github.com/Azure/aks-desktop.git";
    rev = "c0916945b1ae09bcb70a429d3913f0247ad7f9ab";
    hash = "sha256-tgf1+6mSkR2lBOuuYfCfutWsZ22f1DqNNwDlNMaPhsg=";
    fetchSubmodules = true;
  };

  rootNpmDeps = pkgs.fetchNpmDeps {
    inherit src;
    hash = "sha256-8WnplBUOzsQI/y/VtVe9ez2gEejsDPt3ccwlNxQYNjc=";
  };

  pluginAksDesktopNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/plugins/aks-desktop";
    hash = "sha256-61ClV/iGzoK+KVbqctfBp0xxOZ7mMFCpzhlWC4uo2gM=";
  };

  pluginAiAssistantNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/plugins/ai-assistant";
    hash = "sha256-a+9gXM+5hUTjVu/h8ZxxQRHxKjhbUOtkk6Uhq/No9Zc=";
  };

  pluginInsightsNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/plugins/insights-plugin";
    hash = "sha256-ba6r6tAkZXKRXFSnkJS0LhnJvpKnTEv1onMpxXXcFGU=";
  };

  headlampFrontendNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/headlamp/frontend";
    hash = "sha256-v8aMlOk2JD2DzcUMWTK+2QP44n1Nl0LQPcIry7W51vg=";
  };

  headlampAppNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/headlamp/app";
    hash = "sha256-/z53xdC8FY1j0akGTy4oxUAR24tymS8b93FxNZai+iY=";
  };
in
  stdenv.mkDerivation {
    pname = "aks-desktop";
    inherit version src;

    nativeBuildInputs = with pkgs; [
      makeWrapper
      nodejs_22
      go
      python3
      pkg-config
      git
      autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      alsa-lib
      at-spi2-atk
      atk
      cairo
      cups
      dbus
      expat
      glib
      gtk3
      libdrm
      libgbm
      libGL
      libxcrypt-legacy
      libxkbcommon
      nspr
      nss
      pango
      stdenv.cc.cc.lib
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxrender
      libxtst
      libxcb
    ];

    postPatch = ''
      # Make npm steps deterministic and compatible with sandboxed builds.
      substituteInPlace build/setup-plugins.ts \
        --replace-fail 'npm install && npm run build' 'npm ci --offline --no-audit --fund=false && npm run build'

      substituteInPlace headlamp/Makefile \
        --replace-fail 'cd app && npm install && node ./scripts/setup-plugins.js && npm run build' 'cd app && npm ci --offline --no-audit --fund=false && node ./scripts/setup-plugins.js && npm run build' \
        --replace-fail 'cd frontend && npm install' 'cd frontend && npm ci --offline --no-audit --fund=false' \
        --replace-fail 'cd app && npm install' 'cd app && npm ci --offline --no-audit --fund=false'
    '';

    buildPhase = ''
      runHook preBuild

      export HOME="$TMPDIR/home"
      mkdir -p "$HOME"

      # Keep plugin setup from trying to download bundled external tools.
      mkdir -p headlamp/app/resources/external-tools

      use_npm_cache() {
        local cacheTar="$1"
        export npm_config_cache="$TMPDIR/npm-cache"
        rm -rf "$npm_config_cache"
        mkdir -p "$npm_config_cache"
        tar -xf "$cacheTar" -C "$npm_config_cache"
      }

      use_npm_cache "${rootNpmDeps}"
      npm ci --offline --no-audit --fund=false

      use_npm_cache "${pluginAksDesktopNpmDeps}"
      (cd plugins/aks-desktop && npm ci --offline --no-audit --fund=false)

      use_npm_cache "${pluginAiAssistantNpmDeps}"
      (cd plugins/ai-assistant && npm ci --offline --no-audit --fund=false)

      use_npm_cache "${pluginInsightsNpmDeps}"
      (cd plugins/insights-plugin && npm ci --offline --no-audit --fund=false)

      use_npm_cache "${headlampFrontendNpmDeps}"
      (cd headlamp/frontend && npm ci --offline --no-audit --fund=false)

      use_npm_cache "${headlampAppNpmDeps}"
      (cd headlamp/app && npm ci --offline --no-audit --fund=false)

      npm run build:linux

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/opt/aks-desktop" "$out/bin" "$out/share/applications"
      cp -r headlamp/app/dist/linux-unpacked/. "$out/opt/aks-desktop"

      chmod +x "$out/opt/aks-desktop/aks-desktop" "$out/opt/aks-desktop/chrome-sandbox"

      makeWrapper "$out/opt/aks-desktop/aks-desktop" "$out/bin/aks-desktop" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [
        pkgs.alsa-lib
        pkgs.at-spi2-atk
        pkgs.atk
        pkgs.cairo
        pkgs.cups
        pkgs.dbus
        pkgs.expat
        pkgs.glib
        pkgs.gtk3
        pkgs.libdrm
        pkgs.libgbm
        pkgs.libGL
        pkgs.libxcrypt-legacy
        pkgs.libxkbcommon
        pkgs.nspr
        pkgs.nss
        pkgs.pango
        pkgs.stdenv.cc.cc.lib
        pkgs.libx11
        pkgs.libxcomposite
        pkgs.libxdamage
        pkgs.libxext
        pkgs.libxfixes
        pkgs.libxrandr
        pkgs.libxrender
        pkgs.libxtst
        pkgs.libxcb
      ]}"

      install -Dm644 headlamp/frontend/public/android-chrome-512x512.png \
        "$out/share/icons/hicolor/512x512/apps/aks-desktop.png"

      cat > "$out/share/applications/aks-desktop.desktop" <<EOF
      [Desktop Entry]
      Type=Application
      Name=AKS Desktop
      Comment=Application-focused experience for Azure Kubernetes Service
      Exec=$out/bin/aks-desktop
      Icon=aks-desktop
      Terminal=false
      Categories=Development;
      EOF

      runHook postInstall
    '';

    meta = with lib; {
      description = "AKS Desktop built from source";
      homepage = "https://github.com/Azure/aks-desktop";
      license = licenses.asl20;
      sourceProvenance = [sourceTypes.fromSource];
      platforms = ["x86_64-linux" "aarch64-linux"];
      mainProgram = "aks-desktop";
      maintainers = [];
    };
  }
