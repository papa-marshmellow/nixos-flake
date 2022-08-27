{ pkgs, ... }:

{
# home = {
#   pointercursor = {
#     package = pkgs.numix-cursor-theme;
#     name = "numix-cursor-light";
#     size = 32;
#     gtk.enable = true;
#     x11.enable = true;
#   };
# };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.numix-icon-theme;
      name = "Numix";
    };
    theme = {
      package = pkgs.numix-solarized-gtk-theme;
      name = "NumixSolarizedDarkCyan";
    };
  };

  services = {

    # Network Manager applet
    network-manager-applet.enable = true;

    # Flash drive mounting
    udiskie.enable = true;

  };

  programs = {

    # System monitor
    htop.enable = true;

    # Img viewer and background setter
    feh.enable = true;

    # Media player
    mpv.enable = true;

  };
}
