{
  pkgs,
  pkgs-legacy,
  ...
}: {
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-openconnect
      networkmanager-fortisslvpn
      pkgs-legacy.networkmanager-vpnc
    ];
    enable = true;
  };
}
