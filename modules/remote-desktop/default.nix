{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs;[
    remmina
    freerdp
  ];
}