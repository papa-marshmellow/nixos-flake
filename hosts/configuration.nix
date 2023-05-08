{ config, lib, pkgs, inputs, user, ... }:

{
  imports = [
    ( import ../modules/shell )
    ( import ../modules/nvim )
  ];

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm" "libvirtd" ];
    shell = pkgs.fish;
  };

  # Select internationalisation properties.
  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.utf8";

  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };

  environment = {
    variables = {
      TERMINAL = "urxvt";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  # modify display method
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Enable sound
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  services = {

    # CUPS
    printing.enable = true;

    # Enable flash drives
    udisks2.enable = true;

    # Enable PC/SC
    pcscd.enable = true;

  };

  fonts.fonts = with pkgs; [
    ubuntu_font_family
    font-awesome
    corefonts
    carlito
    vegur
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings.auto-optimise-store = true;
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.unstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  system = {
    stateVersion = "23.05";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable/";
    };
  };

}
