{ config, pkgs, ... }:

{

  imports = [
   ( import ./hardware-configuration.nix )
   ( import ../../modules/desktop/bspwm )
   ( import ../../modules/virtualization )
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
      useOSProber = true;
    };
  };

  networking = {
    hostName = "fridge";
    wireless.iwd.enable = true;
  };

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

}
