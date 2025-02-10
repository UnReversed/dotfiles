{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 0;
      expandtab = true;

      smartindent = true;
      shiftwidth = 2;

      breakindent = true;

      ignorecase = true;
      smartcase = true;

      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];

      swapfile = false;
      autoread = true;
      backup = false;
      undofile = true;

      termguicolors = true;

      cursorline = true;
    };
  };
}

