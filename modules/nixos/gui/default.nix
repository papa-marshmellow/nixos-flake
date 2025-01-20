{
  imports = [
    ./hyprland..nix
  ];
  services.wayland.enable = true;
  services.xwayland.enable = true;
}
