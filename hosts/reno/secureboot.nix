{lanzaboote, ...}: {
  imports = [
    lanzaboote.nixosModules.lanzaboote
  ];
  boot = {
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
    };
    initrd.systemd = {
      enable = true;
      tpm2.enable = true;
    };
    lanzaboote = {
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
