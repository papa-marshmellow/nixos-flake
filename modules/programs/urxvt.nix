{ pkgs, ... }:

{

  programs.urxvt = {
    enable = true;
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
    fonts = [ "xft:FiraCode Nerd Font Mono:pixelsize=28" ];
    scroll.bar.enable = false;
    extraConfig = {
      depth = 32;
      letterSpace = -1;
      urlLauncher = "librewolf";
      cursorColor = "#FDF6E3";
      internalBorder = 15;
      background = "[75]#002B36";
      foreground = "#FDF6E3";

      # Default colors
      color0 = "#000000";
      color1 = "#CB4B16";
      color2 = "#859900";
      color3 = "#B58900";
      color4 = "#268BD2";
      color5 = "#D33682";
      color6 = "#2AA198";
      color7 = "#FDF6E3";

      # Bright colors
      color8 = "#000000";
      color9 = "#CB4B16";
      color10 = "#859900";
      color11 = "#B58900";
      color12 = "#268BD2";
      color13 = "#D33682";
      color14 = "#2AA198";
      color15 = "#FDF6E3";
    };
  };
}
