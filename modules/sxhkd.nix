{ pkgs, ... }:

{
  services = {
    sxhkd = {
      enable = true;
      keybindings = {
        # WM independant keys
        # Terminal
        "super + Return" = "urxvt -e fish";
        # Application launcher
        "super + @space" = "rofi -show drun";
        # Reload sxhkd files
        "super + Escape" = "pkill -USR1 -x sxhkd";
        # Quit/Reload BSPWM
        "super + alt + {q,r}" = "bspc {quit,wm -r}";
        # Close and kill
        "super + q" = "bspc node -c";
        # Toggle monocle
        "super + m" = "bspc desktop -l next";
        # Set window state
        "super + {t,shift + t,s,f}" = "bspc node -t {tiled, pseudo_tiled,floating,fullscreen}";
        # focus node in given direction
        "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
        # Focus or sent to the given desktop
        "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
        # expand the window
        "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0";
        # contract a window
        "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20, bottom 0 -20, left 20 0";
        # Move a floating window
        "super + {Left,Down,Up,Right}" = "bspc node -v {-30 0,0 30,0 -30,30 0}";
        # Monitor Brightness Keys
        "XF86MonBrightnessDown" = "brightnessctl set 10%-";
        "XF86MonBrightnessUp" = "brightnessctl set +10%";
      };
    };
  };
}
