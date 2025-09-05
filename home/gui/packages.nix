{pkgs, ...}: {
  home.packages = with pkgs; [
    ueberzugpp
    grim

    # gui to better visualize hyprland posiotns of monitors
    nwg-displays

    remmina
    freerdp

    kdePackages.breeze-icons
    rambox
    keepassxc
    kdePackages.ark

    pavucontrol
  ];
}
