{ config, pkgs, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sophie";
  home.homeDirectory = "/home/sophie";

  home.packages = [
    pkgs.nss_latest
    pkgs.discord-canary
    pkgs.spotify
    (import ~/nixos/home/pkgs/python.nix { inherit pkgs; })
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.overlays = [
    (import ~/nixos/overlays/discord-canary.nix)
    #(import ~/nixos/overlays/spotify.nix)
    (import ~/nixos/overlays/nss.nix)  # this works but NOT FUCKING SPOTIFY
  ];
}
