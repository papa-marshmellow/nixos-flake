{ pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 10;
            y = 10;
          };
        };
        font = {
          normal.family = "Ubuntu Mono";
          bold.family = "Ubuntu Mono";
          italic.family = "Ubuntu Mono";
          bold_italic.family = "Ubuntu Mono";
          size = 12;
        };
        colors = {
          primary = {
            background = "#002b36";
            foreground = "#FDF6E3";
          };
          normal = {
            black = "#073642";
            red = "#dc322f";
            green = "#859900";
            yellow = "#b58900";
            blue = "#268bd2";
            magenta = "#d33682";
            cyan = "#2aa198";
            white = "#eee8d5";
          };
        };
      };
    };
  };
}
