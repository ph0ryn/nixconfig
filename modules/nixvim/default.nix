{
  nixvim,
  ...
}:
{
  imports = [
    nixvim.homeModules.nixvim
    ./settings.nix
    ./opts.nix
    ./lsp.nix
    ./plugins.nix
  ];

  programs.nixvim.extraConfigLua = builtins.readFile ./extraConfig.lua;
}
