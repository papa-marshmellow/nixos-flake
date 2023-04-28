{ pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      border_radius = 6;
      window_gap = 10;
      split_ratio = 0.5;
      focus_follows_pointer = true;
      normal_border_color = "#002B36";
      active_border_color = "#2AA198";
      focused_border_color = "#2AA198";
      top_padding = "30";
    };
    rules = {
      "mpv" = {
        state = "floating";
        follow = true;
      };
    };
  };
}
