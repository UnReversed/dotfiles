{
  pkgs,
  version,
  src,
  pluginAksDesktopNpmDeps,
  pluginAiAssistantNpmDeps,
  insightsPluginTarball,
}: let
  pluginAksDesktop = pkgs.buildNpmPackage {
    pname = "aks-desktop-plugin-aks-desktop";
    inherit version;

    src = "${src}/plugins/aks-desktop";
    nodejs = pkgs.nodejs_22;
    npmDeps = pluginAksDesktopNpmDeps;
    npmBuildScript = "build";

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -r dist "$out/"
      cp package.json "$out/"

      runHook postInstall
    '';

    meta = {
      platforms = ["x86_64-linux" "aarch64-linux"];
    };
  };

  pluginAiAssistant = pkgs.buildNpmPackage {
    pname = "aks-desktop-plugin-ai-assistant";
    inherit version;

    src = "${src}/plugins/ai-assistant";
    nodejs = pkgs.nodejs_22;
    npmDeps = pluginAiAssistantNpmDeps;
    npmBuildScript = "build";

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -r dist "$out/"
      cp package.json "$out/"

      runHook postInstall
    '';

    meta = {
      platforms = ["x86_64-linux" "aarch64-linux"];
    };
  };

  pluginInsights = pkgs.stdenvNoCC.mkDerivation {
    pname = "aks-desktop-plugin-insights";
    inherit version;

    src = insightsPluginTarball;
    dontUnpack = true;

    nativeBuildInputs = [pkgs.gnutar pkgs.gzip];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/dist" "$out/dist/locales"

      tar --no-same-owner --no-same-permissions -xzf "$src" \
        --strip-components=1 -C "$out/dist" \
        insights-plugin/main.js \
        insights-plugin/main.wasm.gz \
        insights-plugin/package.json \
        insights-plugin/locales/en/translation.json \
        insights-plugin/locales/de/translation.json

      cp "$out/dist/package.json" "$out/package.json"

      runHook postInstall
    '';

    meta = {
      platforms = ["x86_64-linux" "aarch64-linux"];
    };
  };
in {
  inherit pluginAksDesktop pluginAiAssistant pluginInsights;
}
