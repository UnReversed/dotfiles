{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar
  ];
  home.packages = with pkgs; [
    wlogout
  ];
}
