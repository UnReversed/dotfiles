{pkgs}: {
  aks-desktop = import ./aks-desktop.nix {inherit pkgs;};
}
