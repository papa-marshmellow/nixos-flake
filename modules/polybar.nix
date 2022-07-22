{ config, pkgs, ... }:

{
  services = {
    polybar = {
      script = "polybar mybar -r";
      enable = true;
      config = {
        "colors" = {
          background = "#002B36";
          background-alt = "#073642";
          foreground = "#FDF6E3";
          foreground-alt = "#EEE8D5";
          primary = "#2AA198";
          secondary = "#B58900";
          tertiary = "#DC322F";
        };
        "bar/mybar" = {
          background = "\${colors.background}";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          enable-ipc = "true";
          font-0 = "Ubuntu Mono:pixelsize=17;2";
          foreground = "\${colors.foreground}";
          height = "30px";
          module-margin = 1;
          modules-left = "xworkspaces";
          modules-center = "date";
          modules-right = "battery";
          override-redirect = "true";
          padding-right = 1;
          tray-position = "right";
          width = "100%";
          wm-restack = "bspwm";
        };
        "module/battery" = {
          type = "internal/battery";
          adapter = "ACAD";
          battery = "BAT1";
          format-charging = "<label-charging>";
          format-discharging = "<label-discharging>";
          format-full = "<label-full>";
          format-low = "<label-low>";
          format-low-foreground = "\${colors.tertiary}";
          label-charging = "+%percentage%%";
          label-discharging = "-%percentage%%";
          label-full = "full";
          label-low = "-%percentage%%";
          low-at = 10;
          poll-interval = 5;
        };
        "module/date" = {
          type = "internal/date";
          internal = 5;
          label = "%time%";
          time = "%a %l:%M %P";
        };
        "module/xworkspaces" = {
          type = "internal/xworkspaces";
          label-active = "%index%";
          label-active-background = "\${colors.background-alt}";
          label-active-padding = 1;
          label-active-underline = "\${colors.primary}";
          label-empty = "%index%";
          label-empty-padding = 1;
          label-occupied = "%index%";
          label-occupied-padding = 1;
          label-urgent = "%index%";
          label-urgent-padding = 1;
        };
        "settings" = {
          pseudo-transparency = "true";
          screenchange-reload = "true";
        };
      };
    };
  };
}
