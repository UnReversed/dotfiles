{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    dust
    # nix formatter
    alejandra

    openconnect
    devenv
    sbctl
  ];
}
