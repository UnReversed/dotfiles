{nix-index-database, ...}: {
  imports = [
    nix-index-database.homeModules.nix-index
  ];
  programs = {
    nix-index.enable = true;
    nix-index-database.comma.enable = true;
  };
}
