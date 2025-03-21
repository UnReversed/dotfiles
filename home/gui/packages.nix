{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
    grim

    # gui to better visualize hyprland posiotns of monitors
    nwg-displays

    remmina
    freerdp

    rambox
    keepassxc
    libsForQt5.ark

    pavucontrol
  ];
}
