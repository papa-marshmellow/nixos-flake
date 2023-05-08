{ pkgs, lib, user, ... }:

{

  imports = [
    ( import ./hardware-configuration.nix )
    ( import ../../modules/virtualisation )
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking = {
    hostName = "frying-pan";
    wireless.iwd.enable = true;
  };

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Set lid switch action
  services.logind.lidSwitch = "ignore";

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

}
