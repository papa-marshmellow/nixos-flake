{ config, pkgs, ... }:

{
  imports = [( import ../../modules )];

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
    brightnessctl
    xfce.thunar
    gnucash
    deluge
    mate.atril
    libreoffice
    cmus
    jamesdsp
    ncspot
  ];

  # Bluetooth tray applet
  services.blueman-applet.enable = true;

  # Enable pasystray
  services.pasystray.enable = true;

  # Enable ncspot
  services.ncspot = {
    enable = true;
    settings = {
    };
  };

  xsession = {
    windowManager = {
      bspwm = {
        startupPrograms = [
          "polybar mybar -r"
          "mullvad-vpn"
          "blueman-applet"
          "feh --bg-fill $HOME/.wall.*"
        ];
        monitors = {
          eDP = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
        };
      };
    };
  };
}
