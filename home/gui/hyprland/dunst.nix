{lib, ...}: {
  services.dunst.enable = true;
  systemd.user.services.network-manager-applet.Unit.After = lib.mkForce "graphical-session.target";
}
