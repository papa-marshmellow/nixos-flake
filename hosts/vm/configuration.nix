{ config, pkgs, ... }:

{

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  services.xserver.resolutions = [
    {
      x = 1600;
      y = 900;
    };
  ];

  networking = {
    hostName = "nix-box";
  };

}
