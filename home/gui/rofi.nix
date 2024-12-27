{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
    extraConfig = {
      run-command = "uwsm app -- {cmd}";
    };
  };
}
