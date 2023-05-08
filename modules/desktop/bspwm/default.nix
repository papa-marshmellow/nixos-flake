{ config, lib, pkgs, host, ... }:

{
   programs.dconf.enable = true;

  services = {
    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;

      displayManager = {
        lightdm = {
          enable = true;
          background = ;
          greeters = {
            gtk = {
              theme = {
                package = pkgs.numix-solarized-gtk-theme;
                name = "NumixSolarizedDarkCyan";
              };
              cursorTheme = {
                package = pkgs.numix-cursor-theme;
                name = "numix-cursor-dark";
                size = 32;
              };
            };
          };
        };
        defaultSession = "none+bspwm";
      };
      windowManager= {
        bspwm = {
          enable = true;
        };
      };
    };
  };
}