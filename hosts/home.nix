{ config, lib, pkgs, user, ... }:

{
  imports = [
    ( import ../modules/services )
  ];

  programs.home-manager.enable = true;

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # Utils
      vim
      killall
      ripgrep
      eza
      fd
      tldr
      ffmpeg_6
      ranger
      neofetch
      cmatrix
      cbonsai

      # Compression
      p7zip
      zip
      unzip
      unrar

      # Networking Tools
      traceroute
      nmap
      speedtest-cli

      # Resource Monitors
      htop
      btop

      # Development
      nodejs_22
      yo
    ];

    stateVersion = "24.05";
  };
}