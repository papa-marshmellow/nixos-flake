{ config, lib, pkgs, user, ... }:

{
  imports = [
    ( import ../modules/programs )
    ( import ../modules/services )
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # System apps
      vim
      wget
      usbutils
      pciutils
      killall
      ripgrep
      exa
      fd
      xorg.xkill
      tldr
      appimage-run

      # Compression
      p7zip
      zip
      unzip
      unrar

      # Network tools
      traceroute
      nmap
      speedtest-cli

      # Resource Monitors
      htop
      btop

      # Desktop Environment Deps
      pavucontrol
      ffmpeg_5

      # Applications
      ipmitool
      firefox
      ranger
      keepassxc
      neofetch
      cmatrix
      xfce.xfce4-screenshooter
      feh
      mpv
    ];

    file.".config/wall".source = ../modules/themes/wall;

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.numix-cursor-theme;
      name = "numix-cursor-dark";
      size = 32;
    };
    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };

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
    font = {
      name = "FiraCode Nerd Font Mono Medium";
    };
  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  services = {

    # Network Manager applet
    network-manager-applet.enable = true;

    # Flash drive mounting
    udiskie.enable = true;

  };

}