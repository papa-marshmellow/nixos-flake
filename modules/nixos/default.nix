# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ flake, pkgs, lib, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  # These users can add Nix caches.
  nix.settings.trusted-users = [ "root" "lowgain" ];

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;
  programs.ssh = {
    startAgent = true;
    extraConfig = "AddKeysToAgent Yes";
  };
}
