{...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        pull.rebase = true;
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
