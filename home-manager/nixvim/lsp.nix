{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          nixd.enable = true;
          ruff.enable = true;
          tsgo.enable = true;
        };
      };
    };
  };
}
