{ config, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  environment = {
    variables = {
      TERMINAL = "urxvt";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  nix = {
    settings.auto-optimise-store = true;
    optimise.automatic = true;
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

  };

  # modify display method
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Enable sound
  sound.enable = true;
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    pciutils
    firefox
    ffmpeg_5
    killall
    p7zip
    unrar
    zip
    unzip
    traceroute
    ripgrep
    exa
    ranger
    fd
    pavucontrol
    keepassxc
    neofetch
    cmatrix
    polybar
    xfce.xfce4-screenshooter
    xorg.xkill
    ipmitool
    speedtest-cli
    nmap
  ];

  users.users.lowgain = {
    isNormalUser = true;
    description = "Logan Thompson";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    initialPassword = "password";
  };

  services = {

    # CUPS
    printing.enable = true;

    # Enable flash drives
    udisks2.enable = true;

    # Enable PC/SC
    pcscd.enable = true;

  };

  programs = {

    # Enable the gnupg agent
    gnupg.agent.enable = true;

    # Enable dconf for home manager daemon
    dconf.enable = true;

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

  system = {
    stateVersion = "23.05";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable/";
    };
  };

}
