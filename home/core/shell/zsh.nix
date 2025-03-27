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
        plugins = ["git" "terraform"];
        theme = "gnzh";
      };
      shellAliases = {
        cd = "z";
        cat = "bat";
      };
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
    };
    pay-respects = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
  };
}
