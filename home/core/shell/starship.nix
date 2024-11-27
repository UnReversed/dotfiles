{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;

      azure = {
        disabled = false;
      };

      bun = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      directory = {
        read_only = " 󰌾";
      };

      direnv = {
        disabled = false;
      };

      docker_context = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      git_commit = {
        tag_symbol = "  ";
      };

      golang = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      nodejs = {
        symbol = " ";
        detect_files = [
          "package.json"
          ".node-version"
          "!bunfig.toml"
          "!bun.lockb"
        ];
      };

      package = {
        symbol = "󰏗 ";
      };

      python = {
        symbol = " ";
      };

      rust = {
        symbol = "󱘗 ";
      };
    };
  };
}
