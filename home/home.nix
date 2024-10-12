{...}: {
  home.username = "test";
  home.homeDirectory = "/home/test";

  imports = [
    ./shell
    ./waybar
    ./packages.nix
    ./editors
    ./containers.nix
    ./hyper
    ./browser
  ];

  services.ssh-agent.enable = true;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
