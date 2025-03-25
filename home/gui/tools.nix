{pkgs, ...}: {
  home.packages = with pkgs; [
    networkmanager-openvpn
  ];
  services = {
    flameshot = {
      enable = true;
      package = pkgs.flameshot.override {
        enableWlrSupport = true;
      };
    };
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
    # udisks2 pop-up
    udiskie.enable = true;
  };
}
