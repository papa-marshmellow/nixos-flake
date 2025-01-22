{ pkgs, lib, ... }:
{

  imports = [
    ./fix-cursor.nix
    ./waybar.nix
    ./settings.nix
    ./fonts.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };

  home.packages = with pkgs; [
    miru
    xfce.thunar
    pavucontrol
    mate.atril
    firefox
  ];

  services = {
    dunst.enable = true;
    udiskie.enable = true;
    network-manager-applet.enable = true;
    pasystray.enable = true;
    blueman-applet.enable = true;
  };

  programs = {
    hyprlock.enable = true;
    rofi = {
      enable = true;
      terminal = lib.getExe pkgs.rio;
      plugins = [ pkgs.rofi-emoji ];
    };
    mpv = {
      enable = true;
      package = (
        pkgs.mpv-unwrapped.wrapper {
          scripts = with pkgs.mpvScripts; [
            webtorrent-mpv-hook
          ];
          mpv = pkgs.mpv-unwrapped.override {
            waylandSupport = true;
          };
        }
      );
    };
  };
}
