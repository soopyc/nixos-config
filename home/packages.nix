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

  # Libs
  nss_latest

  # Ricing
  pfetch
  hyfetch

  # Remote
  mosh

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
