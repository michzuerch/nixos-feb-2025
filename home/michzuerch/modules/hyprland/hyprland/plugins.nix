{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      "plugin:dynamic-cursors" = {
        enabled = true;
        mode = "shake";
        rotate = {
          # length in px of the simulated stick used to rotate the cursor
          # most realistic if this is your actual cursor size
          length = 20;

          # clockwise offset applied to the angle in degrees
          # this will apply to ALL shapes
          offset = 0.0;
        };

        shake = {
          # enables shake to find
          enabled = true;

          # use nearest-neighbour (pixelated) scaling when shaking
          # may look weird when effects are enabled
          nearest = true;

          # controls how soon a shake is detected
          # lower values mean sooner
          threshold = 6.0;

          # magnification level immediately after shake start
          base = 4.0;
          # magnification increase per second when continuing to shake
          speed = 4.0;
          # how much the speed is influenced by the current shake intensitiy
          influence = 0.0;

          # maximal magnification the cursor can reach
          # values below 1 disable the limit (e.g. 0)
          limit = 0.0;

          # time in millseconds the cursor will stay magnified after a shake has ended
          timeout = 2000;

          # show cursor behaviour `tilt`, `rotate`, etc. while shaking
          effects = false;

          # enable ipc events for shake
          # see the `ipc` section below
          ipc = false;
        };
      };

      "plugin:hyprexpo" = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(111111)";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
        enable_gesture = true; # laptop touchpad, 4 fingers
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive = swipe down. Negative = swipe up.
      };
    };
  };
}
