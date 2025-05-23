{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {disable_loading_bar = false;};

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      image = [
        {
          monitor = "";
          # path = ~/.face.png
          size = 150;
          rounding = -1;
          border_size = 3;
          rotate = 0;
          reload_time = -1;
          reload_cmd = "";

          position = "0, 70";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 3;
          dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = "0.15"; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = false;
          dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
          dots_fade_time = 200; # Milliseconds until a dot fully fades in
          fade_on_empty = true;
          fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
          placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
          fail_timeout = 5000; # milliseconds before fail_text and fail_color disappears
          fail_transition = 300; # transition time in ms between normal outer_color and fail_color
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
          invert_numlock = false; # change color if numlock is off
          swap_font_color = false; # see below

          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME"; # Text rendered in the label.

          position = "0, 340";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "<b>  </b>"; # Text rendered in the label.

          position = "0, -400";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
