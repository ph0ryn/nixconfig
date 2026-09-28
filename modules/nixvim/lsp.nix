{
  programs.nixvim = {
    plugins.lazy.settings.spec = [
      { __unkeyed = "neovim/nvim-lspconfig"; }
    ];

    lsp.servers = {
      lua_ls.enable = true;
      bashls.enable = true;
      nixd.enable = true;
      ruff.enable = true;
      tsgo.enable = true;
    };
  };
}
