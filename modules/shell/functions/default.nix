{ lib, ... }:
{
  programs = {
    zsh = {
      initContent = lib.mkAfter ''
        source ${./functions.sh}

        zle -N jump-ghq
        bindkey '^g' jump-ghq
      '';
    };
  };
}
