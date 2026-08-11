{pkgs}: let
  version = "0.9.1";

  src = pkgs.fetchgit {
    url = "https://github.com/Azure/aks-desktop.git";
    rev = "c0916945b1ae09bcb70a429d3913f0247ad7f9ab";
    hash = "sha256-tgf1+6mSkR2lBOuuYfCfutWsZ22f1DqNNwDlNMaPhsg=";
    fetchSubmodules = true;
  };

  pluginAksDesktopNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/plugins/aks-desktop";
    hash = "sha256-61ClV/iGzoK+KVbqctfBp0xxOZ7mMFCpzhlWC4uo2gM=";
  };

  pluginAiAssistantNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/plugins/ai-assistant";
    hash = "sha256-a+9gXM+5hUTjVu/h8ZxxQRHxKjhbUOtkk6Uhq/No9Zc=";
  };

  headlampFrontendNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/headlamp/frontend";
    hash = "sha256-v8aMlOk2JD2DzcUMWTK+2QP44n1Nl0LQPcIry7W51vg=";
  };

  headlampAppNpmDeps = pkgs.fetchNpmDeps {
    src = "${src}/headlamp/app";
    hash = "sha256-/z53xdC8FY1j0akGTy4oxUAR24tymS8b93FxNZai+iY=";
  };

  insightsPluginTarball = pkgs.fetchurl {
    url = "https://github.com/inspektor-gadget/insights-plugin/releases/download/v0.2.8/insights-plugin-0.2.8.tar.gz";
    hash = "sha256-kTyAI7jwPp4K4yeJd2DiIPWwXCo7z9lpuxzlNVpMBJw=";
  };
in {
  inherit
    version
    src
    pluginAksDesktopNpmDeps
    pluginAiAssistantNpmDeps
    headlampFrontendNpmDeps
    headlampAppNpmDeps
    insightsPluginTarball
    ;
}
