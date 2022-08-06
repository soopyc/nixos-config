{ pkgs, ... }: 
  {
    fonts.fonts = with pkgs;[
      noto-fonts
      #stable.noto-fonts-cjk
      source-han-mono
      source-han-sans
      noto-fonts-extra
      ipafont
      liberation_ttf
  ];
}
