{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.denops-vim
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          ruff.enable = true;
        };
      };

      transparent = {
        enable = true;
        autoLoad = true;
      };

      gitsigns = {
        enable = true;
        autoLoad = true;
      };

      hlchunk = {
        enable = true;
        autoLoad = true;
        settings = {
          blank.enable = false;
          chunk = {
            chars = {
              horizontal_line = "─";
              left_bottom = "╰";
              left_top = "╭";
              right_arrow = "─";
              vertical_line = "│";
            };
            enable = true;
            style = "#45475a";
            use_treesitter = true;
          };
          indent = {
            chars = [ "│" ];
            priority = 10;
            style = "#45475a";
            use_treesitter = false;
          };
          line_num = {
            style = "#91bef0";
            use_treesitter = true;
          };
        };
      };

      which-key = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
