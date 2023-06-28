{ pkgs, ... }:

{
  imports = [
    ( import ./docker.nix )
    ( import ./qemu.nix )
  ];
}
