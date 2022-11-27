{ pkgs, ... }:

{

  programs.urxvt = {
    enable = true;
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
    fonts = [ "xft:Ubuntu Mono:pixelsize=28" ];
    scroll.bar.enable = false;
    extraConfig = {
      depth = 32;
      letterSpace = -1;
      urlLauncher = "librewolf";
      cursorColor = "#FDF6E3";
      internalBorder = 15;
      background = "[75]#002B36";
      foreground = "#FDF6E3";
      color0 = "#000000";
      color8 = "#000000";
      color1 = "#CB4B16";
      color9 = "#CB4B16";
      color2 = "#859900";
      color10 = "#859900";
      color3 = "#B58900";
      color11 = "#B58900";
      color4 = "#268BD2";
      color12 = "#268BD2";
      color5 = "#D33682";
      color13 = "#D33682";
      color6 = "#2AA198";
      color14 = "#2AA198";
      color7 = "#FDF6E3";
      color15 = "#FDF6E3";
    };
  };
}
