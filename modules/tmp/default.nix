{...}:
{
  services.udisks2.enable = true;

  services.fwupd.enable = true;

  #qt from HM dont propagade env t
  qt = {
    enable = true;
    platformTheme =  "gnome";
    style = "adwaita-dark";
  };

}