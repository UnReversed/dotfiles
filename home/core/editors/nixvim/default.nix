{
  imports = [
    ./lsp
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    plugins = {
      web-devicons.enable = true;
      helm.enable = true;
      yazi = {
        enable = true;
      };
    };
  };
}
