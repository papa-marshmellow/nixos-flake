# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-b21098ae-a29f-4f14-bb51-f373f3ab89a4".device = "/dev/disk/by-uuid/b21098ae-a29f-4f14-bb51-f373f3ab89a4";
  boot.initrd.luks.devices."luks-b21098ae-a29f-4f14-bb51-f373f3ab89a4".keyFile = "/crypto_keyfile.bin";

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Select internationalisation properties.
  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.utf8";

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.bspwm.enable = true;

    # Confiure keyboard layout
    layout = "us";
    xkbVariant = "";

    # Enable trackpad
    libinput.enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };

  # Enable sound with pipewire.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    ffmpeg_5
    killall
    unrar
    unzip
  ];

  users.users.marshey = {
    isNormalUser = true;
    description = "Logan Thompson";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    initialPassword = "password";
    # shell = pkgs.fish;
  };

  services = {

    # CUPS
    printing.enable = true;

    # Enable flash drives
    udisks2.enable = true;

    # Mullvad VPN
    mullvad-vpn.enable = true;

  };

  programs = {

    gnupg.agent.enable = true;

    dconf.enable = true;

    # Allow xwayland for wayland apps
    xwayland.enable = true;

  };

  fonts.fonts = with pkgs; [
    ubuntu_font_family
    font-awesome
    corefonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

  system.stateVersion = "22.05";

}
