{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    git-filter-repo
    ghq
  ];

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        language = "en";
      };
      git = {
        autoFetch = true;
        autoFetchInterval = 120;
      };
    };
  };

  programs.yazi.enable = true;
}
