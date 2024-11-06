{...}: {
  home.username = "unreversed";
  home.homeDirectory = "/home/unreversed";

  imports = [
    ./shell
    ./waybar
    ./packages.nix
    ./editors
    ./containers.nix
    ./hyper
  ];

  services.ssh-agent.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
