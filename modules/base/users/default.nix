{pkgs, ...}: {
  security.sudo.wheelNeedsPassword = false;

  users = {
    # mutableUsers = false;
    users.unreversed = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        "networkmanager"
        "tss"
        "libvirtd"
      ];
      shell = pkgs.zsh;
    };
  };
}
