{ pkgs, ...}: {
    fonts.fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      liberation_ttf
  ];
}
