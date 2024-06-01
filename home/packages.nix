{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    nh
    nvd
    nix-output-monitor
    neofetch

    du-dust
  ];
}