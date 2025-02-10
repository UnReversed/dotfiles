{
  imports = [
    ./lsp
    ./telescope.nix
    ./treesitter.nix
    ./cmp.nix
    ./opts.nix
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
      web-devicons.enable = true;
      helm.enable = true;
      yazi = {
        enable = true;
      };
      which-key.enable = true;
    };
  };
}
