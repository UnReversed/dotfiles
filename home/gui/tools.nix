{
  pkgs,
  lib,
  ...
}: {
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
  systemd.user.services.blueman-applet.Unit.After = lib.mkForce "graphical-session.target";
  systemd.user.services.network-manager-applet.Unit.After = lib.mkForce "graphical-session.target";
}
