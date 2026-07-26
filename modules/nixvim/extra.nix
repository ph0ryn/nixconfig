{ pkgs, ... }:
let
  buildVimPlugin =
    {
      owner,
      repo,
      rev,
      sha256,
    }:
    pkgs.vimUtils.buildVimPlugin rec {
      inherit repo;
      name = repo;
      src = pkgs.fetchFromGitHub {
        inherit
          owner
          repo
          rev
          sha256
          ;
      };
    };
in
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.denops-vim
      pkgs.vimPlugins.ddc-vim
      pkgs.vimPlugins.ddc-ui-native
      pkgs.vimPlugins.ddc-source-lsp
      pkgs.vimPlugins.ddc-source-around
      pkgs.vimPlugins.ddc-source-file
      pkgs.vimPlugins.ddc-filter-sorter_rank
      pkgs.vimPlugins.ddc-filter-matcher_head

      (buildVimPlugin {
        repo = "denops-signature_help";
        owner = "matsui54";
        rev = "f56884f3eed5af6c13cc414a092ce05ca9ad2612";
        sha256 = "5V4Joj0mTUEFVz/c2y9cMHA7DKJEZuL1OeGlyf04xhI=";
      })
      (buildVimPlugin {
        repo = "denops-popup-preview.vim";
        owner = "matsui54";
        rev = "e2c967a02f18e5f3a00b3ea216d6f7d3dcaf9d82";
        sha256 = "xPg1MQR/JuF8fvlHxyckFvRbSxFwz0eYxBNvWUZoTWA=";
      })
    ];

    extraConfigLua = (builtins.readFile ./extraConfig.lua);
  };
}
