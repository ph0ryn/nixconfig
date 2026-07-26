{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    plemoljp-nf
  ];

  fonts.fontconfig.defaultFonts = {
    serif = [
      "Noto Serif CJK JP"
      "Noto Color Emoji"
    ];
    sansSerif = [
      "Noto Sans CJK JP"
      "Noto Color Emoji"
    ];
    emoji = [ "Noto Color Emoji" ];
  };
}
