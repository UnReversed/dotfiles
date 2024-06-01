{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs;[
    rustdesk
    remmina
    freerdp
  ];
}