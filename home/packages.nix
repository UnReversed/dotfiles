{pkgs, ...}: {
  home.packages = with pkgs; [
    openconnect
    sbctl
    openfortivpn
  ];
}
