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
    ./extra.nix
  ];
}
