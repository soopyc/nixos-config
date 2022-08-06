{ pkgs, ... }: {
    fonts.fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      ipafont
      liberation_ttf
  ];
}
