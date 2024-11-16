{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    du-dust
    # nix formatter
    alejandra
    # udisks2 pop-up
    udiskie

    # gui to better visualize hyprland posiotns of monitors
    nwg-displays
    breeze-icons

    pavucontrol

    dolphin
    networkmanagerapplet

    remmina
    freerdp

    keepassxc
    rclone
    rambox

    networkmanager-openvpn
    openvpn3
  ];
}
