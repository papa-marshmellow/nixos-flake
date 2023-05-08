{ config, pkgs, ... }:

{

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

}
