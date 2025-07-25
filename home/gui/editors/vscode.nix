{pkgs, ...}: let
  extension = pkgs.pkgs-ext.vscode-marketplace;
  shared-extensions = with extension;
    [
      pkief.material-product-icons
      pkief.material-icon-theme
      mhutchie.git-graph
      waderyan.gitblame
      mkhl.direnv
      jnoortheen.nix-ide
      kamadorueda.alejandra

      ms-vscode.remote-explorer
      # ms-azuretools.vscode-docker
      docker.docker
      ms-azuretools.vscode-containers
      ms-kubernetes-tools.vscode-kubernetes-tools

      ms-kubernetes-tools.vscode-aks-tools
      ms-azure-devops.azure-pipelines
      christopherhx.azure-pipelines-vscode-ext
      redhat.vscode-yaml
      christian-kohler.path-intellisense
    ]
    ++ (with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-containers
      sonarsource.sonarlint-vscode
    ]);
  shared-userSettings = {
    "editor.fontFamily" = "'Hack Nerd Font','Droid Sans Mono', 'monospace'";
    "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
    "chat.agent.enabled" = false;
    "terminal.integrated.enableImages" = true;
    "workbench.colorTheme" = "Default Dark+";
    "workbench.iconTheme" = "material-icon-theme";
    "gitblame.inlineMessageEnabled" = true;
    "remote.SSH.localServerDownload" = "off";
    "remote.SSH.enableX11Forwarding" = false;
    "remote.SSH.connectTimeout" = 30;
    "remote.SSH.defaultExtensions" = [
      "PKief.material-icon-theme"
      "PKief.material-product-icons"
      "mhutchie.git-graph"
      "waderyan.gitblame"
    ];
    "sonarlint.pathToNodeExecutable" = "${pkgs.nodejs_24}";
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
            ms-azuretools.vscode-azurefunctions
          ])
          ++ (with pkgs.vscode-extensions; [
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            ms-dotnettools.vscode-dotnet-runtime
            ms-dotnettools.vscodeintellicode-csharp
            humao.rest-client
          ])
          ++ shared-extensions;
        userSettings =
          {
            "csharp.suppressBuildAssetsNotification" = true;
          }
          // shared-userSettings;
      };
      go = {
        extensions =
          (
            with pkgs.vscode-extensions; [
              golang.go
            ]
          )
          ++ shared-extensions;
        userSettings = shared-userSettings;
      };
    };
  };
  home.packages = with pkgs; [
    temurin-bin-21
  ];
}
