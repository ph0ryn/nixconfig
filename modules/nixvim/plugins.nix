{
  programs.nixvim =
    { lib, ... }:
    {
      plugins.lazy.settings.spec = [
        {
          __unkeyed = "catppuccin/nvim";
          name = "catppuccin";
          main = "catppuccin";
          priority = 1000;
          config = lib.nixvim.mkRaw ''function() require("catppuccin").setup(); vim.cmd.colorscheme("catppuccin") end'';
        }
        {
          __unkeyed = "nvim-tree/nvim-web-devicons";
          main = "nvim-web-devicons";
          config = true;
        }
        {
          __unkeyed = "romgrk/barbar.nvim";
          main = "barbar";
          dependencies = [ "nvim-tree/nvim-web-devicons" ];
          config = true;
        }
        {
          __unkeyed = "j-hui/fidget.nvim";
          main = "fidget";
          config = true;
        }
        {
          __unkeyed = "xiyaowong/transparent.nvim";
          main = "transparent";
          config = true;
        }
        {
          __unkeyed = "lewis6991/gitsigns.nvim";
          main = "gitsigns";
          config = true;
        }
        {
          __unkeyed = "folke/which-key.nvim";
          main = "which-key";
          config = true;
        }
        {
          __unkeyed = "shellRaining/hlchunk.nvim";
          main = "hlchunk";
          opts = {
            blank.enable = false;
            chunk = {
              enable = true;
              use_treesitter = false;
            };
            indent = {
              enable = true;
              style = lib.nixvim.mkRaw ''vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui")'';
            };
            line_num = {
              enable = true;
              style = "#806d9c";
            };
          };
        }
        { __unkeyed = "vim-denops/denops.vim"; }
        {
          __unkeyed = "Shougo/ddc.vim";
          dependencies = [ "vim-denops/denops.vim" ];
        }
        { __unkeyed = "Shougo/ddc-ui-native"; }
        { __unkeyed = "Shougo/ddc-source-lsp"; }
        { __unkeyed = "Shougo/ddc-source-around"; }
        { __unkeyed = "LumaKernel/ddc-source-file"; }
        { __unkeyed = "Shougo/ddc-filter-sorter_rank"; }
        { __unkeyed = "Shougo/ddc-filter-matcher_head"; }
        { __unkeyed = "matsui54/denops-signature_help"; }
        { __unkeyed = "matsui54/denops-popup-preview.vim"; }
      ];
    };
}
