{ config, inputs, lib, pkgs, user, ... }:

{
  imports = [
    (../modules/shell)
  ];

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "${user}" ];
    shell = pkgs.fish;
  };

  # Select internationalisation properties.
  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.utf8";

  nixpkgs.config.allowUnfree = true;
  
  nix = {
    settings.auto-optimise-store = true;
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.git;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  system = {
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable/";
    };
  };
}
