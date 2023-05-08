{ config, lib, pkgs, host, user, ...}:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  home-manager.users.${user} = {
    programs.waybar = {
      enable = true;
      systemd ={
        enable = true;
        # Needed for waybar to start automatically
        target = "sway-session.target";
      };

      style = ''
        * {
          border: none;
          font-family: FiraCode Nerd Font Mono;
          font-size: 12px;
          text-shadow: 0px 0px 5px #000000;
        }
        button:hover {
          background-color: rgba(80,100,100,0.4);
        }
        window#waybar {
          background-color: rgba(0,0,0,0.5);
          background: transparent;
          transition-property: background-color;
          transition-duration: .5s;
          border-bottom: none;
        }
        window#waybar.hidden {
          opacity: 0.2;
        }
        #workspace,
        #mode,
        #clock,
        #pulseaudio,
        #custom-sink,
        #network,
        #mpd,
        #network,
        #battery,
        #custom-ds4,
        #tray {
          color: #999999;
          background-clip: padding-box;
        }
        #custom-menu {
          color: #A7C7E7;
          padding: 0px 5px 0px 5px;
        }
        #workspaces button {
          padding: 0px 5px;
          min-width: 5px;
          color: rgba(255,255,255,0.8);
        }
        #workspaces button:hover {
          background-color: rgba(0,0,0,0.2);
        }
        #workspaces button.active {
          color: rgba(255,255,255,0.8);
          background-color: rgba(80,100,100,0.4);
        }
        #workspaces button.visible {
          color: #ccffff;
        }
        #workspaces button.hidden {
          color: #999999;
        }
        #battery.warning {
          color: #ff5d17;
          background-color: rgba(0,0,0,0);
        }
        #battery.critical {
          color: #ff200c;
          background-color: rgba(0,0,0,0);
        }
        #battery.charging {
          color: #9ece6a;
          background-color: rgba(0,0,0,0);
        }
      '';
      settings = with host; {
        Main = {
          layer = "top";
          position = "top";
          height = 16;
          output = [
            "${mainMonitor}"
          ];
          tray = { spacing = 5; };

          modules-left = [ "wlr/workspaces" ];

          modules-center = [ "clock" ];

          modules-right =
            if hostName == "laptop" then
              [ "battery" "backlight" "pulseaudio" "tray" ];
            else
              [ "network" "pulseaudio" "tray" ]

          "wlr/workspaces" = {
            format = "<span font='11'>{name}</span>";
            #format = "<span font='12'>{icon}</span>";
            #format-icons = {
            #  "1"="";
            #  "2"="";
            #  "3"="";
            #  "4"="";
            #  "5"="";
            #  "6"="";
            #  "7"="";
            #  "8"="";
            #  "9"="";
            #  "10"="";
            #};
            #all-outputs = true;
            active-only = false;
            on-click = "activate";
          };
          clock = {
            format = "{:%b %d %H:%M}  ";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            #format-alt = "{:%A, %B %d, %Y} ";
          };
          backlight = {
            device = "intel_backlight";
            format= "{percent}% <span font='11'>{icon}</span>";
            format-icons = ["" ""];
            on-scroll-down = "${pkgs.light}/bin/light -U 5";
            on-scroll-up = "${pkgs.light}/bin/light -A 5";
          };
          battery = {
            interval = 60;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% <span font='11'>{icon}</span>";
            format-charging = "{capacity}% <span font='11'></span>";
            format-icons = ["" "" "" "" ""];
            max-length = 25;
          };
          network = {
            format-wifi = "<span font='11'></span>";
            format-ethernet = "<span font='11'></span>";
            #format-ethernet = "<span font='11'></span> {ifname}: {ipaddr}/{cidr}";
            format-linked = "<span font='11'>睊</span> {ifname} (No IP)";
            format-disconnected = "<span font='11'>睊</span> Not connected";
            #format-alt = "{ifname}: {ipaddr}/{cidr}";
            tooltip-format = "{essid} {ipaddr}/{cidr}";
            #on-click-right = "${pkgs.alacritty}/bin/alacritty -e nmtui";
          };
          pulseaudio = {
            format = "<span font='11'>{icon}</span> {volume}% {format_source} ";
            format-bluetooth = "<span font='11'>{icon}</span> {volume}% {format_source} ";
            format-bluetooth-muted = "<span font='11'>x</span> {volume}% {format_source} ";
            format-muted = "<span font='11'>x</span> {volume}% {format_source} ";
            #format-source = "{volume}% <span font='11'></span>";
            format-source = "<span font='10'></span> ";
            format-source-muted = "<span font='11'> </span> ";
            format-icons = {
              default = [ "" "" "" ];
              headphone = "";
              #hands-free = "";
              #headset = "";
              #phone = "";
              #portable = "";
              #car = "";
            };
            tooltip-format = "{desc}, {volume}%";
            on-click = "${pkgs.pamixer}/bin/pamixer -t";
            on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
            on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
          };
          tray = {
            icon-size = 13;
          };
        };
      };
    };
  };

}