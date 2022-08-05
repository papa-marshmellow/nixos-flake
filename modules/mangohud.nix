{ pkgs, ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      background_alpha = "0.3";
      font_size = "20";
      background_color = "002B36";
      text_color = "FDF6E3";
      position = "top-right";
      no_display = true;
      toggle_hud = "F11";
      cpu_stats = true;
      cpu_temp = true;
      cpu_color = "2AA198";
      gpu_stats = true;
      gpu_temp = true;
      gpu_color = "859900";
      ram = true;
      ram_color = "D33682";
      engine_color = "B58900";
      frame_timing = 1;
      frametime_color = "839496";
    };
    settingsPerApplication = {
      mpv = {
        no_display = true;
      };
    };
  };
}
