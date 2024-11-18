{pkgs, ...}: {
  home.packages = with pkgs; [
    kubectl
    docker-compose

    kubecolor
    fluxcd
    kubernetes-helm
  ];

  programs = {
    k9s = {
      enable = true;
    };
  };
}
