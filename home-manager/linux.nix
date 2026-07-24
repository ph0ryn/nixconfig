{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # desktop applications
    zed-editor
  ];
}
