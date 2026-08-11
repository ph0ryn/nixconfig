{ ... }:
{
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;

    extensions = [
      "catppuccin-icons"
      "csharp"
      "git-firefly"
      "html"
      "iwe"
      "macos-classic"
      "nix"
      "oxc"
      "proto"
      "rose-pine-theme"
      "rumdl"
      "sql"
      "swift"
      "toml"
      "tsgo"
    ];

    userSettings = {
      auto_indent_on_paste = false;
      base_keymap = "VSCode";
      buffer_font_family = "PlemolJP35 Console NF";
      buffer_font_size = 11;
      cli_default_open_behavior = "existing_window";
      colorize_brackets = false;
      cursor_shape = "bar";
      diff_view_style = "split";
      edit_predictions = {
        disabled_globs = [ ];
        provider = "copilot";
      };
      file_types.javascript = [ "*.gs" ];
      git_panel = {
        dock = "right";
        file_icons = false;
        tree_view = true;
      };
      gutter = {
        bookmarks = true;
        breakpoints = true;
        folds = true;
        runnables = true;
      };
      icon_theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Mocha";
        mode = "dark";
      };
      languages = {
        "Git Commit".tab_size = 1;
        Markdown = {
          document_folding_ranges = "on";
          formatter.language_server.name = "rumdl";
          format_on_save = "on";
        };
        Python = {
          code_actions_on_format."source.organizeImports.ruff" = true;
          formatter.language_server.name = "ruff";
          language_servers = [
            "ty"
            "ruff"
          ];
        };
        TypeScript = {
          format_on_save = "on";
          formatter = [
            { code_action = "source.fixAll.oxc"; }
            { language_server.name = "oxfmt"; }
          ];
          language_servers = [
            "!vtsls"
            "!typescript-language-server"
            "!eslint"
            "tsgo"
            "oxlint"
            "oxfmt"
            "..."
          ];
        };
      };
      line_ending = "enforce_lf";
      lsp = {
        oxfmt.initialization_options.settings.run = "onSave";
        oxlint.initialization_options.settings = {
          fixKind = "safe_fix";
          run = "onType";
          unusedDisableDirectives = "deny";
        };
        rumdl.settings = {
          configPath = "~/.config/rumdl/rumdl.toml";
          enableAutoFix = true;
        };
      };
      minimap = {
        show = "always";
        thumb = "always";
      };
      on_last_window_closed = "quit_app";
      outline_panel.dock = "right";
      prettier.parser = "";
      project_panel.dock = "left";
      proxy = "";
      scrollbar.show = "never";
      search.case_sensitive = true;
      soft_wrap = "none";
      tab_size = 2;
      tabs.close_position = "left";
      telemetry = {
        anthropic_retention = false;
        diagnostics = true;
        metrics = false;
      };
      terminal = {
        font_family = "PlemolJP35 Console NF";
        font_size = 12;
        font_weight = 400;
        shell = "system";
      };
      text_rendering_mode = "platform_default";
      theme = {
        dark = "Ayu Mirage";
        light = "Rosé Pine Dawn";
        mode = "dark";
      };
      ui_font_family = "PlemolJP35 Console NF";
      ui_font_size = 15;
      vim_mode = false;
    };
  };
}
