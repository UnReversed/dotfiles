{ 
  pkgs, 
  ...
}: {

  security.sudo.wheelNeedsPassword = false;

  users = {
    # mutableUsers = false;
    users.test = {
      isNormalUser = true;
      extraGroups = [ 
        "wheel"
        "docker"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        firefox
        tree
      ];
    };
  };
}