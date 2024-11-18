{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      pkief.material-product-icons

      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      # https://github.com/nix-community/nix-vscode-extensions
      # ms-kubernetes-tools.vscode-aks-tools
      # eamodio.gitlens

      jnoortheen.nix-ide
      mhutchie.git-graph
      kamadorueda.alejandra
      mkhl.direnv
    ];
    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"github:unreversed/dotfiles\").nixosConfigurations.reno.options";
            };
          };
        };
      };
      "nix.formatterPath" = "alejandra";
    };
  };
}
