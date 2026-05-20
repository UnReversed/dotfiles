{pkgs, ...}: {
  imports = [
    ./browser/firefox.nix
    ./wayland
    ./gtk.nix
    ./qt.nix
  ];
  home.packages = with pkgs; [
    # gui to better visualize hyprland posiotns of monitors
    nwg-displays

    remmina
    freerdp

    kdePackages.breeze-icons
    ferdium
    keepassxc
    kdePackages.ark

    pavucontrol
  ];

  services = {
    flameshot = {
      enable = true;
      settings = {
        General = {
          useGrimAdapter = true;
        };
      };
    };
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    # udisks2 pop-up
    udiskie.enable = true;
  };
}
