{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    experimentalBackends = true;
    opacityRules = [
      "75:class_g = 'Alacritty'"
      "75:class_g = 'Thunar'"
    ];
    settings = {
      blur.method = "dual_kawase";
    };
    fade = true;
  };
}
