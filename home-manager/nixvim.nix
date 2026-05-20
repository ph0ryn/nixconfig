{ nixvim, ... }:
{
  imports = [
    nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    globals = {
      transparent_enabled = true;
    };

    nixpkgs.useGlobalPackages = true;
    plugins = {
      transparent = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
