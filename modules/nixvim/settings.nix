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

    nixpkgs.useGlobalPackages = true;
  };
}
