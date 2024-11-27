{
  imports = [
    ./bluetooth.nix
  ];

  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    thermald.enable = true;
  };
  powerManagement.powertop.enable = true;
}
