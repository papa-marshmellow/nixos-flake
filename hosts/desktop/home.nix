{ config, pkgs, ... }:

{
  imports = [
    ( import ../../modules )
    ( import ../../modules/mangohud.nix)
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lowgain";
  home.homeDirectory = "/home/lowgain";

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install applications
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
    cura
    openscad
    discord
    awscli2
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  # Enable pasystray
  services.pasystray.enable = true;

  # enable spotify ncurses terminal client
  programs.ncspot.enable = true;

  xsession = {
    windowManager = {
      bspwm = {
          "$HOME/.screenlayout/default.sh"
          "polybar mybar -r"
          "deluge-gtk"
          "blueman-applet"
          "pa-applet"
          "jamesdsp -t"
          "feh --bg-fill $HOME/.background-image.*"
        ];
        monitors = {
          DisplayPort-0 = [ "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };
}
