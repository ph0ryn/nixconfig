{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        push.followTags = true;
      };
      ignores = [
        ".DS_Store"

        ".vscode/launch.json"

        ".ruff_cache/"
        ".ty_cache/"
        ".venv/"
        ".indexion/"
        ".rumdl_cache/"

        "node_modules/"
      ];
    };
    gh = {
      enable = true;
      extensions = [
        pkgs.gh-fzf-get
        pkgs.gh-license
      ];
      settings = {
        version = 1;
        git_protocol = "ssh";
        prompt = "enabled";
        prefer_editor_prompt = "disabled";
        aliases = {
          co = "pr checkout";
        };
        color_labels = "enabled";
        accessible_colors = "disabled";
        accessible_prompter = "disabled";
        spinner = "enabled";
      };
    };

    lazygit = {
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
  };

  xdg.configFile."keifu/config.toml".source = (pkgs.formats.toml { }).generate "keifu-config.toml" {
    refresh = {
      auto_refresh = true;
      refresh_interval = 10;
      auto_fetch = true;
      fetch_interval = 120;
    };
  };

  home.packages = with pkgs; [
    ghq
    git-filter-repo
    prek
    keifu
  ];
}
