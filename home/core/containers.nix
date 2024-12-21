{pkgs, ...}: {
  home.packages = with pkgs; [
    kubectl
    docker-compose

    fluxcd
    kubernetes-helm
  ];

  programs = {
    k9s = {
      enable = true;
    };
    kubecolor = {
      enable = true;
      enableAlias = true;
    };
  };
}
