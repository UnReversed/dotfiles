{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
    grim

    ghostty
    # gui to better visualize hyprland posiotns of monitors
    nwg-displays

    remmina
    freerdp

    rambox
    keepassxc
  ];
}
