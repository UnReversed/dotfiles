{...}: {
  programs = {
    nix-index.enable = true;
    # broken of collision
    # nix-index-database.comma.enable = true;
  };
}
