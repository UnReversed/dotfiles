{
  pkgs,
  pkgs-legacy,
  ...
}: {
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-openconnect
      pkgs-legacy.networkmanager-vpnc
    ];
    enable = true;
  };
}
