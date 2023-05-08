{ config, pkgs, ... }:

{

  imports = [ 
    ( import ./hardware-configuration.nix )
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  networking = {
    hostName = "nix-box";
  };

}
