{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "systemctl --user start hyprpolkitagent"
      "pypr --debug /tmp/pypr.log"
      # "swaync"
      "hyprpaper"
      "copyq --start-server"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "nm-applet --indicator"
      "blueman-applet"
    ];
  };
}
