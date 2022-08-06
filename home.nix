{ config, pkgs, ... }:
  let 
    unstable = import <nixpkgs-unstable> {};
  in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sophie";
  home.homeDirectory = "/home/sophie";

  home.packages = [
    pkgs.discord-canary
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
  ];
}
