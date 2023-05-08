{ config, lib, pkgs, system, hyprland, ... }:

let

  exec = "exec Hyprland";

in {

  imports = [ ../../programs/waybar.nix ];

  environment = {

    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        ${exec}
      fi
    '';

    variables = {
      XDG_CURRENT_DESKTOP="Hyprland";
      XDG_SESSION_TYPE="wayland";
      XDG_SESSION_DESKTOP="Hyprland";
    };

    systemPackages = with pkgs; [
      grim
      slurp
      swappy
      swaylock
      wl-clipboard
      wlr-randr
    ];
  };

  security.pam.services.swaylock = {
    text = ''
     auth include login
    '';
  };

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Waybar with experimental features
  nixpkgs.overlays = [
    (final: prev: {
      waybar = hyprland.packages.${system}.waybar-hyprland;
    })
  ];

}
