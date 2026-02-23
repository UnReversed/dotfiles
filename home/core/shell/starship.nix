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

      directory = {
        read_only = " 󰌾";
      };

      direnv = {
        disabled = false;
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

      kubernetes = {
        disabled = false;
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
