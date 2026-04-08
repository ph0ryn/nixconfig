{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # package.disabled = true;
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;
      palette = "prompt";
      format = lib.concatStrings [
        "[](element1)"
        "$username"
        "[](fg:element1 bg:element2)"
        "$directory"
        "[](fg:element2 bg:element3)"
        "$time"
        "[](fg:element3 bg:element4)"
        "[](fg:element4 bg:element5)"
        "[](fg:element5 bg:element6)"
        "$cmd_duration"
        "[](fg:element6)"
        " "
        "$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status"
        "$sudo"
        "$line_break"
        "$jobs$status$container$character"
      ];
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      palettes = {
        prompt = {
          fg = "#F4F4F4";
          element1 = "#9A348E";
          element2 = "#DA627D";
          element3 = "#FCA17D";
          element4 = "#86BBD8";
          element5 = "#33658A";
          element6 = "#06969A";
        };
      };

      username = {
        format = "[$user ]($style)";
        style_root = "fg bg:element1";
        style_user = "fg bg:element1";
        show_always = true;
        disabled = false;
      };
      directory = {
        format = "[ $path ]($style)[$read_only]($read_only_style)";
        style = "fg bg:element2";
        truncation_length = 3;
        truncate_to_repo = true;
        fish_style_pwd_dir_length = 0;
        use_logical_path = true;
        repo_root_format = "[ $before_root_path ]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style)";
        read_only = "🔒";
        read_only_style = "red";
        truncation_symbol = ".../";
        home_symbol = "~";
        use_os_path_sep = true;
        disabled = false;
      };
      time = {
        format = "[ $time ]($style)";
        style = "fg bg:element3";
        use_12hr = false;
        time_format = "%T";
        utc_time_offset = "local";
        time_range = "-";
        disabled = false;
      };
      cmd_duration = {
        min_time = 2000;
        format = "[ $duration ]($style)";
        style = "fg bg:element6";
        show_milliseconds = true;
        show_notifications = false;
        min_time_to_notify = 5000;
        disabled = false;
      };
    };
  };
}
