{ config, lib, pkgs, user, ... }:

{

  wsl = {
    enable = true;
    defaultUser = "${user}";
    docker-desktop.enable = true;
    usbip.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };
}