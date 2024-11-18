{pkgs, ...}: {
  imports = [
    ./audio
    ./fonts
    ./network
    ./nix
    ./security
    ./shell
    ./ssh
    ./users
  ];

  services = {
    udisks2.enable = true;
    fwupd.enable = true;
  };
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];
  programs.neovim.enable = true;
}
