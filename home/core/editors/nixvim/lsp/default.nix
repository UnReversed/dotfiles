{
  imports = [
    ./nixd.nix
    ./dockerls.nix
    ./terraformls.nix
  ];
  programs.nixvim.plugins.lsp.enable = true;
}
