{ pkgs, ... }:

{
  programs = {
    rofi = {
      enable = true;
      theme = "solarized_alternate";
      extraConfig = {
        modi = "drun,run,ssh";
      };
      font = "Ubuntu Mono 14";
    };
  };
}
