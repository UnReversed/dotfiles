{pkgs, ...}: {
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
}
