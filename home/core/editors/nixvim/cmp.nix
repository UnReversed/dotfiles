{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
        };
        sources = [
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "neorg"; }
        ]; 
      };
   };
    cmp-async-path = {
      enable = true;
    };
  };
}

