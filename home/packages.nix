{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    du-dust
    # nix formatter
    alejandra
    breeze-icons

    pavucontrol

    rclone

    openvpn3
    devenv
    distrobox
  ];
}
