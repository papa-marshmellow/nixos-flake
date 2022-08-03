{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    experimentalBackends = true;
    opacityRules = [
      "class_g:70 'Alacritty'"
      "class_g:70 'Thunar'"
    };
    blur.method = "dual_kawase";
    fade = true;
  };
}
