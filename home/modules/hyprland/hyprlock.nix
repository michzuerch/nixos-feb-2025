{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = {
        path = "~/Wallpapers/windows11.jpg";
      };
      input-field = {
        size = "200, 50";
        position = "0, -80";
        dots_center = true;
        outline_thickness = 5;
        placeholder_text = "Enter password";
        shadow_passes = 1;
        font_family = "JetBrains Mono";
        check_color = "rgb(b7c5d3)";
        fail_color = "rgb(f7768e)";
        font_color = "rgb(d8e2ec)";
        inner_color = "rgb(171d23)";
        outer_color = "rgb(526270)";
      };
    };
  };
}
