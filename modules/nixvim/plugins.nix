{ pkgs, ... }:
{
  programs.nixvim =
    { lib, ... }:
    {
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
        };

        # dependencies
        web-devicons.enable = true;
      };
    };
}
