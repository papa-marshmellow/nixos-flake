{ ... }:

{
  imports = [
    ( import ./bspwm.nix )
    ( import ./sxhkd.nix )
    ( import ./home.nix )
    ( import ./alacritty.nix )
    ( import ./fish.nix )
    ( import ./picom.nix )
    ( import ./polybar.nix )
    ( import ./dunst.nix )
    ( import ./neovim.nix )
    ( import ./rofi.nix )
    ( import ./git.nix )
  ];
}
