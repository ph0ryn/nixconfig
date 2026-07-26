{ pkgs, ... }:
{
  programs.bash.enable = true;

  home.packages = with pkgs; [
    # desktop applications
    google-chrome
    zed-editor
  ];

  home.sessionPath = [
    "$HOME/.local/share/pnpm/bin"
  ];

  home.sessionVariables = {
    PNPM_HOME = "$HOME/.local/share/pnpm";
  };
}
