{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;

    autoindent = true;
    smartindent = true;
    smarttab = true;
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;

    expandtab = true;

    wrap = false;

    clipboard = "unnamedplus";

    signcolumn = "yes";

    undofile = true;

    splitright = true;
    splitbelow = true;

    smartcase = true;

    updatetime = 250;
    timeoutlen = 400;

    termguicolors = true;
    scrolloff = 6;
  };
}
