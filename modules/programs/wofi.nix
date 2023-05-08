{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    style = ''
      * {
        font-family: Ubuntu Mono;
        font-size: 14;
      }
    '';
    settings = {
      modi = "drun,run,ssh";
    };
  };
}
