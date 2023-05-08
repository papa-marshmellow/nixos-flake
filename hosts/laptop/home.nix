{ config, pkgs, ... }:

{

  imports = [
    ( import ../../modules/desktop/bspwm/home.nix )
  ];

  # Install applications
  home.packages = with pkgs; [
    libreoffice
    brightnessctl
    gnucash
    deluge
    jamesdsp
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  xsession.windowManager.bspwm.monitors.eDP = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
}
