{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

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

  networking = {
    hostName = "frying-pan";
    firewall = {
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    };
    wireless.iwd.enable = true;
  };

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable Qemu/KVM
  virtualisation.libvirtd.enable = true;

  # Set lid switch action
  services.logind.lidSwitch = "ignore";

  # Enable trackpad
  services.xserver.libinput.enable = true;

  # Enable phone mounting
  services.gvfs.enable = true;

  # Enable steam
  programs.steam.enable = true;

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Enable xpadneo for xbox one controller support
  hardware.xpadneo.enable = true;

  # Enable MYSQL
  services.mysql.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;
}
