{
  pkgs,
  inputs,
  ...
}: let
  extension = inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      pkief.material-product-icons

      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools

      extension.ms-kubernetes-tools.vscode-aks-tools
      extension.eamodio.gitlens

      jnoortheen.nix-ide
      mhutchie.git-graph
      kamadorueda.alejandra
      mkhl.direnv
      ms-python.python
      extension.azure-automation.vscode-azureautomation
      extension.ms-vscode.azure-account
      ms-vscode.powershell
      pkief.material-icon-theme
    ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font','Droid Sans Mono', 'monospace'";
      "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
      "terminal.integrated.enableImages" = true;
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
      "workbench.colorTheme" = "Default Dark+";
      "workbench.iconTheme" = "material-icon-theme";
    };
  };
}
