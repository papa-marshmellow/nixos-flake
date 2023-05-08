{ pkgs, ... }:

{
  imports = [
    ( import ../../modules/desktop/bspwm/home.nix )
  ];

  home.packages = with pkgs; [
    librewolf
    cmus
    gnucash
    xfce.thunar
    deluge
    mate.atril
    guitarix
    gimp
    libreoffice
    openrgb
    abcde
    jamesdsp
    discord
    cura
    openscad
    awscli2
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  # Enable pasystray
  services.pasystray.enable = true;

  # enable spotify ncurses terminal client
  programs.ncspot.enable = true;

  xsession.windowManager.bspwm.monitors = {
    DisplayPort-0 = [ "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
  };
}
