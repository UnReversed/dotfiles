{...}: let
  Pictures = "Pictures/wallpaper";
in {
  home.file."${Pictures}" = {
    source = ../../../assets;
    recursive = true;
    target = Pictures;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        {
          monitor = "";
          path = "${Pictures}/ign_astronaut.png";
          fit_mode = "cover";
        }
      ];
    };
  };
}
