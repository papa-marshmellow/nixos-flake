{ config, pkgs, ... }:

{

  boot.loader.grub = {
    enable = true;
    version = 2;
    devices = [ "/dev/vda1" ];
  };

  networking = {
    hostName = "nix-box";
  };

}
