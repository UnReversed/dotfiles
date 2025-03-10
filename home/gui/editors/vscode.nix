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
    eamodio.gitlens
    mkhl.direnv
    jnoortheen.nix-ide
    kamadorueda.alejandra

    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-containers
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools

    ms-kubernetes-tools.vscode-aks-tools
    ms-azure-devops.azure-pipelines
    christopherhx.azure-pipelines-vscode-ext
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

            ms-python.python
            ms-vscode.powershell
          ]
          ++ shared-extensions;
        userSettings =
          {}
          // shared-userSettings;
      };
      csharp = {
        extensions = with extension;
          [
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            # ms-dotnettools.vscode-dotnet-runtime
            ms-azuretools.vscode-azureresourcegroups
            ms-mssql.mssql
          ]
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
