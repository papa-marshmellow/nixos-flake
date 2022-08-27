{ config, pkgs, ... }:

{

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda1";
  };

  networking = {
    hostName = "nix-box";
  };
}
