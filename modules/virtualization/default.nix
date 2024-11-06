{pkgs, ...}: {
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      liveRestore = true;
      autoPrune.enable = true;
      daemon.settings = {
        "features" = {"containerd-snapshotter" = true;};
      };
    };
    libvirtd = {
      enable = true;

      qemu.RunAsRoot = true;
    };

    lxc.enable = true;
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    virt-viewer

    qemu_kvm
  ];
}
