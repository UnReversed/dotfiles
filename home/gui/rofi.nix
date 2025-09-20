{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-unwrapped;
    extraConfig = {
      run-command = "uwsm app -- {cmd}";
    };
  };
}
