{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ueberzugpp
    grim

    inputs.ghostty.packages.x86_64-linux.default
    # gui to better visualize hyprland posiotns of monitors
    nwg-displays

    remmina
    freerdp

    rambox
    keepassxc
  ];
}
