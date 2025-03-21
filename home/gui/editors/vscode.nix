{
  pkgs,
  self,
  ...
}: let
  extension = pkgs.pkgs-ext.vscode-marketplace;
  shared-extensions = with extension; [
    pkief.material-product-icons
    pkief.material-icon-theme
    mhutchie.git-graph
    waderyan.gitblame
    mkhl.direnv
    jnoortheen.nix-ide
    kamadorueda.alejandra

    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.remote-explorer
    ms-vscode-remote.remote-containers
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools

    ms-kubernetes-tools.vscode-aks-tools
    ms-azure-devops.azure-pipelines
    christopherhx.azure-pipelines-vscode-ext
    redhat.vscode-yaml
    christian-kohler.path-intellisense
  ];
  shared-userSettings = let
    nixos = "(builtins.getFlake \"${self}\").nixosConfigurations.reno.options";
    home-manager = nixos + ".home-manager.users.type.getSubOptions []";
    nixvim = "(${home-manager}).programs.nixvim.type.getSubOptions [\"programs\" \"nixvim\"]";
  in {
    "editor.fontFamily" = "'Hack Nerd Font','Droid Sans Mono', 'monospace'";
    "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
    "terminal.integrated.enableImages" = true;
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd";
    "nix.serverSettings" = {
      nixd.options = {
        nixos.expr = nixos;
        home-manager.expr = home-manager;
        nixvim.expr = nixvim;
      };
    };
    "nix.formatterPath" = "alejandra";
    "workbench.colorTheme" = "Default Dark+";
    "workbench.iconTheme" = "material-icon-theme";
    "remote.SSH.localServerDownload" = "off";
  };
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles = {
      default = {
        extensions = with extension;
          [
            hashicorp.terraform
            hashicorp.hcl

            ms-python.python
            ms-vscode.powershell
          ]
          ++ shared-extensions;
        userSettings =
          {}
          // shared-userSettings;
      };
      csharp = {
        extensions =
          (with extension; [
            ms-azuretools.vscode-azureresourcegroups
            ms-mssql.mssql
          ])
          ++ (with pkgs.vscode-extensions; [
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
          ])
          ++ shared-extensions;
        userSettings =
          {
            "csharp.suppressBuildAssetsNotification" = true;
          }
          // shared-userSettings;
      };
    };
  };
}
