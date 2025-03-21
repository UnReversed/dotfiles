{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    du-dust
    # nix formatter
    alejandra
    kdePackages.breeze-icons

    rclone

    openvpn3
    devenv
    distrobox
  ];
}
