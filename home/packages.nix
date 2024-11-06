{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    nixpkgs-fmt
    neofetch

    du-dust
    alejandra
  ];
}
