{...}:
let 
  Pictures = "Pictures/wallpaper";
in {
  home.file."${Pictures}" = {
    source = ../../assets;
    recursive = true;
    target = Pictures;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${Pictures}/ign_astronaut.png"
      ];

      wallpaper = [
        " ,${Pictures}/ign_astronaut.png"
      ];
    };
  };
}