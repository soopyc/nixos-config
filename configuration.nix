# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #<home-manager/nixos>  # use standalone?

      ./overlays/t2linux-overlay/default.nix
      ./overlays/t2linux-overlay/system-config.nix

      ./misc/plymouth.nix
      ./misc/networking.nix

      ./misc/nix-stuff.nix
      ./misc/locales.nix
      ./misc/fonts.nix

      ./packages/razer.nix
      ./packages/audio.nix
    ];

  #nixpkgs.overlays = [
  #  (import ./overlays/fonts.nix)
  #];

  # Letting the t2linux overlay manage this pos.
  ## Use the systemd-boot EFI boot loader.
  ##boot.loader.systemd-boot.enable = true;
  ##boot.loader.efi.canTouchEfiVariables = false;  ##PLEASE do NOT


  networking.hostName = "marisa"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Hong_Kong";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  #networking.useDHCP = false;
  #networking.interfaces.enp0s20f0u2.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  #sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sophie = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "plugdev"
    ];
  };

  # mfw arch wiki: https://wiki.archlinux.org/title/Fcitx5#Integration
  # thanks arch jp !: http://aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.com/#AAaAaaaAAAaAaaAAAaAaaAAAaaaaAAAaaAAaAAAaAaaAaAAAAaAaAAAAAAAaAAAAAaAaaAAAaAaAAAAaAaaAaAaAAAaAAaaaaAAAAaaAaAAaaaAAAAaAaaaAAaAAaaAAaAaaAAAaAAAaAAAaAaAAAAAaaaaAaAAAaAAaAaAaAAAaaaaaAaAAAAAAaAaaAAAaAAAaAAaaAaaAAaaAaAAAAAaaaaAaAAAaAAAaaaaAAaAaaaAAAaaaaaAaAAAAAaaaAAaAAaaaAAAAaAaaAAAAaAaaAAAAaaaaAAaAaAaAaaaAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAaaAaaAaAAaaaaaAaAAaAaaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaAaaAAaaAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAaAAAaaAaAAaAAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAaAAAaaaaAAAaaaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaaAaAAaaaAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAaaAaaAaAAaaaaAaAaaaAaaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAaAAAaaaaAAAaaAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaaAaAAaaAaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAaaAaaAaAAaaaaAaaAAAaaaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaaAaAAaAaAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaAaAaaaaAAaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaaaAAaaaaAaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaaAaAaaAaAAaaaaaAAaaaAaAaAaaAaAAaaaAaAaAAaAAAaAaaAaAaAAAaaAaAAaaAaaAaaAaAAaaaaAaaAAaaaaaAaaAaAAaaaAaAaAAaAaAaAaaAaAAaaaaaAaAAaaAaaAaaAaAaAAAaaaaAAaaAAaAaaAaAAaaaAaAaAAaAaAaAaaAaAAaaaaaAaAAaAaaaAaaAaAaAAAaaaaAAAaaAaAaaAaAAaaaAaAaAAaAAaaAaaAaAaAAAaaAaAAaAaAaAaaAaAAaaaaAaaAAaaaaaAaaAaAAaaaAaAaAAaaAAaAaaAaAaAAAaaaaAAaaaAaAaaAaAAaaaaaAAaaaAaAaAaaAaAAaaaAaAaAAAaaaaAaaAaAAaaaaaAaAAAaaaaAaaAaAAaaaaaAAaaaAaaaAaaAaAAaaaAaAaAAaAaAaAaaAaAAaaaaaAAaaaAaAaAaaAaAaAAAaaAAaaaaaA
  # Note to self: purge rime's bs files in ~/.l/s/fcitx5/rime/build
  #               after changing any rime thing
  environment.sessionVariables = rec {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE  = "fcitx";
    XMODIFIERS    = "@im=fcitx";
  };
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      enableRimeData = true;
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-rime
      ];
    };
  };

  #home-manager.users.sophie = { ... }: {
  #    imports = [ ./users/sophie.nix ];
  #    home.stateVersion = "22.05";
  #};

  users.defaultUserShell = pkgs.zsh;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    firefox
    breeze-plymouth
    vscode
  ];
  environment.variables.EDITOR = "nvim";
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

