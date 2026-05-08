{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      gtk-tabs-location = "hidden";
      font-family = "Hack Nerd Font";
      theme = "Dark+";
      window-theme = "dark";
      window-decoration = false;
      shell-integration-features = "cursor,sudo,title,ssh-env,ssh-terminfo";
    };
  };
}
