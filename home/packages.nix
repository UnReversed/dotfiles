{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    dust
    # nix formatter
    alejandra

    openvpn3
    openconnect
  ];
}
