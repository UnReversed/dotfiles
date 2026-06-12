{...}: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
      };
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "terraform" "docker" "azure" "docker-compose" "opentofu" "uv"];
        theme = "gnzh";
      };
      shellAliases = {
        cd = "z";
        cat = "bat";
      };
      initContent = ''
        eval "$(devenv hook zsh)"
      '';
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    nix-your-shell = {
      enable = true;
      enableZshIntegration = true;
      nix-output-monitor = {
        enable = true;
      };
    };
    pay-respects = {
      enable = true;
      enableZshIntegration = true;
    };
    bat = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
  };
}
