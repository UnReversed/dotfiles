{pkgs, ...}: {
  home.packages = with pkgs; [
    (kubectl.withKrewPlugins (
      plugins: [
        plugins.edit-secret
      ]
    ))
    docker-compose

    fluxcd
    kubernetes-helm
  ];

  programs = {
    k9s = {
      enable = true;
      plugins = {
        edit-secret = {
          shortCut = "Ctrl-X";
          confirm = false;
          description = "Edit Decoded Secret";
          scopes = [
            "secrets"
          ];
          command = "kubectl";
          background = false;
          args = [
            "modify-secret"
            "--namespace"
            "$NAMESPACE"
            "--context"
            "$CONTEXT"
            "$NAME"
          ];
        };
      };
    };
    kubecolor = {
      enable = true;
      enableAlias = true;
      enableZshIntegration = true;
    };
  };
}
