{pkgs, ...}: {
  imports = [
    ./fonts.nix
  ];
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --time --asterisks --cmd Hyprland --theme border=blue;container=black;prompt=green;input=red";
        user = "greeter";
      };
    };
  };
}
