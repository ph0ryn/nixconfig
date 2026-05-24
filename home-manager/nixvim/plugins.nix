{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      barbar.enable = true;
      fidget.enable = true;
      transparent.enable = true;
      gitsigns.enable = true;
      which-key.enable = true;

      hlchunk = {
        enable = true;
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

      # dependencies
      web-devicons.enable = true;
    };
  };
}
