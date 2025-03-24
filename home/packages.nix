{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    du-dust
    # nix formatter
    alejandra

    openvpn3
  ];
}
