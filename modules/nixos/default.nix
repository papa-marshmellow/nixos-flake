# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  users.users."lowgain" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # These users can add Nix caches.
  nix.settings.trusted-users = [ "root" "lowgain" ];

  nixpkgs.config.allowUnfree = true;
}
