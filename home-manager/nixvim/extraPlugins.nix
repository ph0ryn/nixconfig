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

      (buildVimPlugin {
        repo = "ddc.vim";
        owner = "Shougo";
        rev = "v10.3.0";
        sha256 = "vetnDOYWEg+iuMOFL2GYzVfuYgV94Jl8DzBDZxhAFf0=";
      })
      (buildVimPlugin {
        repo = "ddc-source-lsp";
        owner = "Shougo";
        rev = "v1.2.0";
        sha256 = "XTPDdKtVrhtyUPVHqcrdityamJJTX9GmEFR+EGC8y1Y=";
      })
      (buildVimPlugin {
        repo = "ddc-filter-sorter_rank";
        owner = "Shougo";
        rev = "eed3cb33b3ae3f9128257fcfb95e0511d1b13891";
        sha256 = "8zoRsX7ZNCNkokku0TW0LNkjXmBL8UCu8h3EAe4KQ+g=";
      })
      (buildVimPlugin {
        repo = "denops-signature_help";
        owner = "matsui54";
        rev = "f56884f3eed5af6c13cc414a092ce05ca9ad2612";
        sha256 = "5V4Joj0mTUEFVz/c2y9cMHA7DKJEZuL1OeGlyf04xhI=";
      })
    ];

    extraConfigLua = (builtins.readFile ./extraConfig.lua);
  };
}
