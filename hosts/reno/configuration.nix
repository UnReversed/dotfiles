{
  pkgs,
  disko,
  ...
}: {
  imports = [
    disko.nixosModules.disko
    ./hardware-configuration.nix
    ./secureboot.nix
    ./disko.nix

    ../../modules/base
    ../../modules/virtualization
    ../../modules/wayland
    ../../modules/laptop
  ];

  security.tpm2.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      vaapiVdpau
    ];
  };

  networking.hostName = "reno"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "pl_PL.UTF-8/UTF-8"
    ];
  };
  console = {
    # keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "qwertz";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
