{...}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "code.desktop";
      # "text/html" = "librewolf.desktop";
      # "x-scheme-handler/http" = "librewolf.desktop";
      # "x-scheme-handler/https" = "librewolf.desktop";
      # "x-scheme-handler/about" = "librewolf.desktop";
      # "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
