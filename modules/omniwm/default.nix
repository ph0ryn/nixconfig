{
  config,
  ...
}:
let
  # This flake is used from its checkout at ~/nixconfig, so out-of-store
  # symlinks can point into it. Flake-relative paths would resolve to a
  # read-only Nix store copy instead of the working tree.
  repoDir = "${config.home.homeDirectory}/nixconfig";
in
{
  # Out-of-store symlinks: editing the repo files applies immediately through
  # OmniWM's live reload. OmniWM's GUI replaces the symlink with a regular
  # file when it writes settings; force = true re-links the declarative copy
  # on the next switch. If a GUI rewrite drops the comments, do not commit
  # the stripped file: diff against this repo copy and restore them.
  xdg.configFile."omniwm/settings.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${repoDir}/modules/omniwm/config/settings.toml";
    force = true;
  };

  # OmniShell bar overrides for the Default style. Only keys that differ from
  # the style's own shell.toml / built-in defaults are listed.
  xdg.configFile."omniwm/shell/shell.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${repoDir}/modules/omniwm/config/shell/shell.toml";
    force = true;
  };
}
