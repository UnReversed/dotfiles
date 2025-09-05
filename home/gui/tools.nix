{
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
