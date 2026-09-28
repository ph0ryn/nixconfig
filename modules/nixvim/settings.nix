{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals = {
      transparent_enabled = true;
    };

    plugins.lazy.enable = true;
    # Nixvim provides lazy.nvim from the read-only Nix store.
    plugins.lazy.settings.spec = [
      {
        __unkeyed = "folke/lazy.nvim";
        enabled = false;
      }
    ];

    nixpkgs.useGlobalPackages = true;
  };
}
