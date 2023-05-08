{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        height = 300;
        offset = "20x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#2AA198";
        background = "#002B36";
        foreground = "#FDF6E3";
        font = "FiraCode Nerd Font Mono 14";
      };
    };
  };
}
