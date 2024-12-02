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

    networkmanagerapplet

    remmina
    freerdp

    keepassxc
    rclone
    rambox

    networkmanager-openvpn
    openvpn3
    devenv
    distrobox
    kitty
    grim
  ];

  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {
      enableWlrSupport = true;
    };
  };
}
