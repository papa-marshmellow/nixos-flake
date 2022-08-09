{ pkgs, ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      background_alpha = "0.4";
      font_size = "20";
      background_color = "002B36";
      text_color = "FDF6E3";
      position = "top-left";
      toggle_hud = "F11";
      time = true;
      time_format = "%a %l:%M %P";
      media_player = true;
      battery_icon = true;
      cpu_temp = true;
      cpu_color = "2AA198";
      gpu_temp = true;
      gpu_color = "859900";
      ram = true;
      ram_color = "D33682";
      frame_timing= false;
    };
    settingsPerApplication = {
      mpv = {
        no_display = false;
      };
      "Terraria.bin.x86_64" = {
        background_alpha = "0.4";
        font_size = "20";
        background_color = "002B36";
        text_color = "FDF6E3";
        position = "top-center";
        toggle_hud = "F11";
        time = true;
        time_format = "%a %l:%M %P";
        media_player = true;
        battery_icon = true;
        cpu_temp = true;
        cpu_color = "2AA198";
        gpu_temp = true;
        gpu_color = "859900";
        ram = true;
        ram_color = "D33682";
        frame_timing= false;
      };
    };
  };
}
