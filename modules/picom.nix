{ pkgs, ... }:

{
  services = {
    picom = {
      enable = true;
      vSync = true;
      experimentalBackends = true;
      fade = true;
      backend = "glx";
      opacityRules = [
        "70:class_g = 'Alacritty'"
        "70:class_g = 'Thunar'"
      ];
      settings.blur.method = "kawase";
    };
  };
}
