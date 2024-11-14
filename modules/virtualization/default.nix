{...}: {
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      storageDriver = "btrfs";
      liveRestore = true;
      autoPrune.enable = true;
      daemon.settings = {
        "features" = {"containerd-snapshotter" = true;};
      };
    };
    libvirtd = {
      enable = true;
      qemu.runAsRoot = true;
    };
  };

  programs.virt-manager.enable = true;
}
