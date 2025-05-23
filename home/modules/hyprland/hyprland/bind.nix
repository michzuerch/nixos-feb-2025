{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod,       Return, exec, $terminal"
      "$mainMod,       Q, killactive,"
      #"$mainMod,       Q, exit,"
      "$mainMod,       E, exec, $fileManager"
      "$mainMod,       F, fullscreen"
      "$mainMod,       D, exec, rofi -show drun"
      "$mainMod,       P, pin,"
      "$mainMod,       J, togglesplit,"
      "$mainMod,       period, exec, wofi-emoji"
      # "$mainMod,       V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$mainMod,       B, exec, pkill -SIGUSR2 waybar"
      "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar"
      "$mainMod,       L, exec, loginctl lock-session"
      # "$mainMod SHIFT  P, exec, hyprpicker -a -n"
      "$mainMod,       N, exec, swaync-client -t"
      "$mainMod SHIFT, S, exec, grimblast --notify --freeze copysave area"
      "$mainMod,       O, hyprexpo:expo, toggle"
      "$mainMod SHIFT, O, Hyprspace:overview:toggle"

      "$mainMod,       Tab, focusmonitor, +1"
      "$mainMod SHIFT, Tab, focusmonitor, +1"

      "$mainMod,       T, exec, pypr toggle term"

      # Moving focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      # Resizeing windows                   X  Y
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      # Switch workspaces with mainMod + [0-5]
      "$mainMod, 1, split-workspace, 1"
      "$mainMod, 2, split-workspace, 2"
      "$mainMod, 3, split-workspace, 3"
      "$mainMod, 4, split-workspace, 4"
      "$mainMod, 5, split-workspace, 5"

      # Move active window to a workspace with mainMod + SHIFT + [0-5]
      "$mainMod SHIFT, 1, split-movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, split-movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, split-movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, split-movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, split-movetoworkspacesilent, 5"

      # # Switching workspaces
      # "$mainMod, 1, workspace, 1"
      # "$mainMod, 2, workspace, 2"
      # "$mainMod, 3, workspace, 3"
      # "$mainMod, 4, workspace, 4"
      # "$mainMod, 5, workspace, 5"
      # "$mainMod, 6, workspace, 6"
      # "$mainMod, 7, workspace, 7"
      # "$mainMod, 8, workspace, 8"
      # "$mainMod, 9, workspace, 9"
      # "$mainMod, 0, workspace, 10"

      # # Moving windows to workspaces
      # "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      # "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      # "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      # "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      # "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      # "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      # "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      # "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      # "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      # "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown,  exec, brightnessctl s 10%-"
      ",switch:on:Lid Switch, exec, hyprctl dispatch dpms off"
      ",switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
      #", XF86AudioNext,  exec, playerctl next"
      #", XF86AudioPause, exec, playerctl play-pause"
      #", XF86AudioPlay,  exec, playerctl play-pause"
      #", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
