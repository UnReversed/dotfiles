{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      run-command = "uwsm app -- {cmd}";
    };
    plugins = with pkgs; [
      rofi-calc
    ];
    modes = [
      "window"
      "run"
      "ssh"
      "drun"
      "combi"
      "calc"
    ];
  };
}
