{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;
      # dim_inactive = false;
      active_opacity = 1;
      inactive_opacity = 0.75;
      shadow = {
        enabled = true;
        ignore_window = true;
        range = 20;
        render_power = 5;
      };

      blur = {
        enabled = true;
        size = 16;
        passes = 2;
        popups = true;
        # new_optimizations = true;
        # ignore_opacity = true;
        # noise = 0.0117;
        # contrast = 1.2;
        # xray = false;
        # brightness = 1;
      };
    };
  };
}
