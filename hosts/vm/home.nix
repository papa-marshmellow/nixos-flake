{ config, pkgs, ... }:

{
  # Install applications
  # home.packages = with pkgs; [
  # ];

  xsession.windowManager.bspwm.monitors.Virtual-1 = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];

  services.picom = {
    vSync = false;
    backend = "xrender";
  };

}
