{ ... }

{

  programs.urxvt = {
    enable = true;
    keybindings = {
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
    transparent = true;
    fonts = [ "xft:Ubuntu Mono:pixelsize=28" ];
    extraConfig = {
      depth = 32;
      letterSpace = -1;
      urlLauncher = librewolf;
      cursorColor = #FDF6E3;
      internalBorder = 15;
      background = [75]#002b36;
      foreground = #FDF6E3;
      !! light colors
      color8 = #002b3b ! black
      color9 = #CB4B16 ! red
      color10 = #859900 ! green
      color11 = #B58900 ! yellow
      color12 = #268BD2 ! blue
      color13 = #D33682 ! magenta
      color14 = #2AA198 ! cyan
      color15 = #FDF6E3 ! white
    };
  };
};
