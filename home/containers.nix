{pkgs, ...}: {
  home.packages = with pkgs; [
    kubectl
    docker-compose

    fluxcd
    helm
  ];

  programs = {
    k9s = {
      enable = true;
    };
  };
}
