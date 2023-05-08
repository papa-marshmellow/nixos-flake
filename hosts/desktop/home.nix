{ pkgs, ... }:

{

  home.packages = with pkgs; [
    gnucash
    deluge
    guitarix
    gimp
    libreoffice
    openrgb
    abcde
    cura
    openscad
    jamesdsp
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

}
