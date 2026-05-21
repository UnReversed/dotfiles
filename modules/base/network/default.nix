{pkgs, ...}: {
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-openconnect
      networkmanager-fortisslvpn
    ];
    enable = true;
  };
}
