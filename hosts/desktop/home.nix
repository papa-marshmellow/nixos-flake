{ pkgs, ... }:

{
  imports = [
    ( import ../../modules/desktop/bspwm/home.nix )
  ];

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

  xsession.windowManager.bspwm.monitors = {
    DisplayPort-0 = [ "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
  };
}
