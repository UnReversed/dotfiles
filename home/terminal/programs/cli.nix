{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    unzip
    unrar
    _7zz

    dust
    devenv
  ];
}
