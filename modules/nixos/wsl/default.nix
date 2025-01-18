{ flake, pkgs, ... }:

{
  imports = [
    flake.inputs.nixos-wsl.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    wget
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };

  wsl = import ./wsl.nix // {
    enable = true;
  };
}
