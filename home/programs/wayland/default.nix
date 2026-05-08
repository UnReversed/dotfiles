{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar
    ./rofi.nix
  ];
  home.packages = with pkgs; [
    wl-clipboard
  ];
  programs.wlogout = {
    enable = true;
  };
  services.hyprpolkitagent.enable = true;
  services.dunst.enable = true;
}
