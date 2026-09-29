{
  programs.nixvim =
    { lib, pkgs, ... }:
    {
      extraPackages = [ pkgs.tree-sitter ];

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
          __unkeyed = "nvim-neo-tree/neo-tree.nvim";
          main = "neo-tree";
          branch = "v3.x";
          lazy = false;
          dependencies = [
            "nvim-lua/plenary.nvim"
            "MunifTanjim/nui.nvim"
            "nvim-tree/nvim-web-devicons"
          ];
          opts.filesystem.filtered_items.visible = true;
        }
        {
          __unkeyed = "nvim-lualine/lualine.nvim";
          main = "lualine";
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
          config = lib.nixvim.mkRaw ''
            function(_, opts)
              local helper = require("hlchunk.utils.chunkHelper")
              local get_chunk_range = helper.get_chunk_range
              -- hlchunk's delayed callback combines the old buffer with the current cursor.
              helper.get_chunk_range = function(args)
                local bufnr = args.pos.bufnr
                if bufnr ~= 0 and bufnr ~= vim.api.nvim_get_current_buf() then
                  return helper.CHUNK_RANGE_RET.NO_CHUNK, { bufnr = bufnr, start = -1, finish = -1 }
                end
                return get_chunk_range(args)
              end
              require("hlchunk").setup(opts)
            end
          '';
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
        {
          __unkeyed = "nvim-treesitter/nvim-treesitter";
          lazy = false;
          build = ":TSUpdate";
        }
        {
          __unkeyed = "moonbit-community/moonbit.nvim";
          main = "moonbit";
          dependencies = [
            "nvim-lua/plenary.nvim"
            "nvim-treesitter/nvim-treesitter"
          ];
          opts.treesitter.auto_install = true;
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
