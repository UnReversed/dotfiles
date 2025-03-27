{
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar
    ./dunst.nix
  ];
  programs.wlogout = {
    enable = true;
  };
  services.hyprpolkitagent.enable = true;
}
