pkgs: with pkgs; [
  # Audio
  pulseaudio
  qpwgraph

  # Tools
  nox
  thefuck
  ack
  file
  inxi
  ripgrep
  htop
  unzip
  zip  # OK.
  polkit
  psmisc
  xsel

  # Libs
  nss_latest

  # Ricing
  pfetch
  hyfetch

  # Remote
  mosh

  # IME
  ## do this in i18n.input
  #fcitx5
  #fcitx5-rime
  #fcitx5-mozc
  #rime-data
  libsForQt5.fcitx5-qt
  fcitx5-gtk
  fcitx5-configtool

  # Editors
  neovim
  kate
  sumneko-lua-language-server

  # Development/Building
  #gcc replaced by clang/llvm
  clang
  llvm
  gnumake
  git

  # Languages
  (import ./pkgs/python.nix {inherit pkgs;})
  nodejs

  # Office-ish stuff
  okular

  # KDE Addons
  sddm-kcm
  plasma-nm

  # Peripheral Config
  polychromatic
  openrazer-daemon

  # Non-free shit
  discord-canary
  spotify
]
