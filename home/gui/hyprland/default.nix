{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar
    ./dunst.nix
  ];
  home.packages = with pkgs; [
    wlogout
  ];
  # fix https://github.com/nix-community/home-manager/issues/5899#issuecomment-2498226238
  # https://github.com/nix-community/home-manager/pull/6086
  systemd.user.services.hypridle.Unit.After = lib.mkForce "graphical-session.target";
  systemd.user.services.hyprpaper.Unit.After = lib.mkForce "graphical-session.target";
}
