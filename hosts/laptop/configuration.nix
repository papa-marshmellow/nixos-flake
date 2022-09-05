{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.resumeDevice = "/dev/mapper/luks-b21098ae-a29f-4f14-bb51-f373f3ab89a4";

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

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-b21098ae-a29f-4f14-bb51-f373f3ab89a4".device = "/dev/disk/by-uuid/b21098ae-a29f-4f14-bb51-f373f3ab89a4";
  boot.initrd.luks.devices."luks-b21098ae-a29f-4f14-bb51-f373f3ab89a4".keyFile = "/crypto_keyfile.bin";

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

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;
}
