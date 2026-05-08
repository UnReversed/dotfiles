{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd

    # nix formatter
    alejandra
  ];
  programs.nh = {
    enable = true;
    flake = "/home/unreversed/nixos";
  };
}
