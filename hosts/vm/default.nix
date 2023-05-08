{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  imports = [ 
    ( import ./hardware-configuration.nix )
    ( import ../../modules/desktop/bspwm )
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  services.xserver.resolutions = [
    {
      x = 1600;
      y = 900;
    }
  ];

  networking = {
    hostName = "nix-box";
  };

}
