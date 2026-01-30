{pkgs, ...}: let
  shared-extensions = pkgs.nix4vscode.forVscode [
    "pkief.material-product-icons"
    "pkief.material-icon-theme"
    "mhutchie.git-graph"
    "mkhl.direnv"
    "jnoortheen.nix-ide"
    "kamadorueda.alejandra"

    "ms-vscode.remote-explorer"
    "docker.docker"
    "ms-azuretools.vscode-containers"
    "ms-kubernetes-tools.vscode-kubernetes-tools"

    "ms-kubernetes-tools.vscode-aks-tools"
    "ms-azure-devops.azure-pipelines"
    "christopherhx.azure-pipelines-vscode-ext"
    "redhat.vscode-yaml"
    "christian-kohler.path-intellisense"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode-remote.remote-containers"
    "sonarsource.sonarlint-vscode"
  ];
  shared-userSettings = {
    "editor.fontFamily" = "'Hack Nerd Font','Droid Sans Mono', 'monospace'";
    "terminal.integrated.fontFamily" = "'Hack Nerd Font'";
    "chat.agent.enabled" = false;
    "terminal.integrated.enableImages" = true;
    "workbench.colorTheme" = "Default Dark+";
    "workbench.iconTheme" = "material-icon-theme";
    "git.blame.editorDecoration.enabled" = true;
    "remote.SSH.localServerDownload" = "off";
    "remote.SSH.enableX11Forwarding" = false;
    "remote.SSH.connectTimeout" = 30;
    "remote.SSH.defaultExtensions" = [
      "PKief.material-icon-theme"
      "PKief.material-product-icons"
      "mhutchie.git-graph"
    ];
    "sonarlint.pathToNodeExecutable" = "${pkgs.nodejs_24}/bin/node";
    "sonarlint.ls.javaHome" = "${pkgs.temurin-bin-25}";
    "docker.extension.enableComposeLanguageServer" = false;
  };
in {
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;
        extensions =
          pkgs.nix4vscode.forVscode [
            "hashicorp.terraform"
            "hashicorp.hcl"

            "ms-python.python"
            "ms-vscode.powershell"
          ]
          ++ shared-extensions;
        userSettings =
          {}
          // shared-userSettings;
      };
      csharp = {
        extensions =
          pkgs.nix4vscode.forVscode [
            "ms-azuretools.vscode-azureresourcegroups"
            "ms-mssql.mssql"
            "ms-azuretools.vscode-azurefunctions"
            "ms-dotnettools.csdevkit"
            "ms-dotnettools.csharp"
            "ms-dotnettools.vscode-dotnet-runtime"
            "github.copilot-chat"
            "humao.rest-client"
          ]
          ++ shared-extensions;
        userSettings =
          {
            "csharp.suppressBuildAssetsNotification" = true;
          }
          // shared-userSettings;
      };
      go = {
        extensions =
          pkgs.nix4vscode.forVscode [
            "golang.go"
          ]
          ++ shared-extensions;
        userSettings = shared-userSettings;
      };
      nodejs = {
        extensions =
          pkgs.nix4vscode.forVscode [
            "mikestead.dotenv"
            "EditorConfig.EditorConfig"
            "dbaeumer.vscode-eslint"
            "xabikos.JavaScriptSnippets"
            "christian-kohler.npm-intellisense"
            "esbenp.prettier-vscode"
            "humao.rest-client"
            "ms-azuretools.vscode-azurefunctions"
            "ms-azuretools.vscode-azureresourcegroups"
            "ms-azuretools.vscode-azurestorage"
            "Azurite.azurite"
          ]
          ++ shared-extensions;
        userSettings =
          {
            "editor.formatOnPaste" = true;
            "git.autofetch" = true;
            "[markdown]" = {
              "editor.wordWrap" = "on";
            };
            "[json]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[jsonc]" = {
              "editor.defaultFormatter" = "vscode.json-language-features";
            };
            "[html]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[javascript]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            "[typescript]" = {
              "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
          }
          // shared-userSettings;
      };
    };
  };
}
