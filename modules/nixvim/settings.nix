{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals = {
      transparent_enabled = true;
    };

    colorschemes.catppuccin.enable = true;

    nixpkgs.useGlobalPackages = true;
  };
}
