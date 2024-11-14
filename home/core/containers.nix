{pkgs, ...}: {
  home.packages = with pkgs; [
    kubectl
    docker-compose

    kubecolor
    fluxcd
    helm
  ];

  programs = {
    k9s = {
      enable = true;
    };
  };
}
