{pkgs, ...}: {
  home.packages = with pkgs; [
    azure-cli
    azuredatastudio
  ];
}
