{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      gtk-tabs-location = "hidden";
      font-family = "{{ terminal_font }}";
      theme = "Dark+";
      window-theme = "dark";
      #window-decoration = false
    };
  };
}
