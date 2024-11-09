{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix LSP
    nixd
    neofetch

    du-dust
    # nix formatter
    alejandra
    # udisks2 pop-up
    udiskie

    # gui to better visualize hyprland posiotns of monitors
    nwg-displays 

    pavucontrol
    
    dolphin
  ];
}
