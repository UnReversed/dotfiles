{
  pkgs,
  ...
} : {

  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];
  # services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    theme = "chili";
  };
}