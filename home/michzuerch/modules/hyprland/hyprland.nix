{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      #inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      #pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      "plugin:dynamic-cursors" = {
        enabled = true;
        mode = "stretch";

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

      "$mod" = "SUPER";

      xwayland = {
        force_zero_scaling = true;
      };

      env = [
        "XCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"
        "GTK_THEME,adw-gtk3"
        "HYPRCURSOR_SIZE,24"
        # XDG
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # QT
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,gkt2"
        "QT_STYLE_OVERRIDE,gtk2"

        # Toolkit
        "SDL_VIDEODRIVER,wayland"
        "_JAVA_AWT_WM_NONEREPARENTING,1"
        "_JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on"
        "JAVA_FONTS,/usr/share/fonts/TTF"
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland"

        # Enabling firefox wayland
        "BROWSER,firefox"
        "MOZ_ENABLE_WAYLAND,1"

        "ELECTRON_OZONE_PLATFORM_HINT,wayland"

        "TERM,alacritty"
        "NIXOS_OZONE_WL,1"
      ];

      binds = {
        allow_workspace_cycles = false;
        focus_preferred_method = 1;
        workspace_center_on = 1;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        repeat_rate = 50;
        repeat_delay = 350;
        float_switch_override_focus = 1;
        mouse_refocus = true;
        sensitivity = 0.6; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = " rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        shadow = {
          enabled = true;
          range = 60;
          render_power = 3;
          color = "rgba(1E202966)";
          offset = "1 2";
          scale = 0.97;
        };
        rounding = 8;
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
        };
        active_opacity = 0.9;
        inactive_opacity = 0.5;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = false;
      };

      misc = {
        disable_hyprland_logo = true;
        focus_on_activate = true;
        layers_hog_keyboard_focus = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        animate_mouse_windowdragging = true;
        animate_manual_resizes = true;
        allow_session_lock_restore = false;
        disable_splash_rendering = false;
        new_window_takes_over_fullscreen = true;
        enable_swallow = true;
        swallow_regex = "alacritty|tmux|zellij";
        disable_autoreload = true;
        vfr = true;
      };

      debug = {
        disable_logs = true;
      };

      exec-once = [
        "waybar"
        "swaync"
        "copyq --start-server"
        "systemctl --user start hyprpolkitagent"
        "udiske"
        "blueman-applet"
        "nm-applet"
        "pypr"
        "hypridle"
      ];
      exec = ["hyprpaper"];
      monitor = ",preferred,auto,1";
      windowrule = [
        "float, title:^(Open File)(.*)$"
        "float, title:^(Select a File)(.*)$"
        "float, title:^(Open Folder)(.*)$"
        "float, title:^(Save As)(.*)$"
        "float, title:^(Choose wallpaper)(.*)$"
        "float, title:^(Library)(.*)$"
        "float, title:^(File Upload)(.*)$"
        "float, class:^(viewnior)$"
        "float, class:^(feh)$"
        "float, class:^(pavucontrol-qt)$"
        "float, class:^(pavucontrol)$"
        "float, class:^(file-roller)$"
        "fullscreen, class:^(wlogout)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float, title:^(Media viewer)$"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(pavucontrol)$"
        "float, title:^(blueman-manager)$"
        "size 800 600, title:^(Volume Control)$"
        "move 75 44%, title:^(Volume Control)$"
        "float, title:^(blueberry.py)$"
      ];

      windowrulev2 = let
        rulesForWindow = window: map (rule: "${rule},${window}");
      in
        []
        # Specific window rules
        ++ (rulesForWindow "title:^()$,class:^(steam)$" ["stayfocused" "minsize 1 1"])
        ++ (rulesForWindow "class:^(sideterm)$" ["float" "move 60% 10" "size 750 350" "animation slide"])
        # ++ (rulesForWindow "class:^(looking-glass-client)$" ["immediate"])
        ++ (rulesForWindow "class:^(middleterm)$" ["float" "size 750 550" "animation slide"])
        ++ (rulesForWindow "class:^(guifetch)$" ["float" "animation slide" "move 10 10"])
        ++ (rulesForWindow "class:^(listen_blue)$" ["size 813 695" "float" "center"])
        ++ (rulesForWindow "class:^(firefox)$" ["opacity 0.999 0.999"])
        # General window rules
        ++ (rulesForWindow "floating:0" ["rounding 0"])
        ++ (rulesForWindow "floating:1" ["rounding 5"])
        ++ (rulesForWindow "floating:0" ["noshadow"]);

      bind =
        [
          "SUPER,Z,exec,pypr toggle term && hyprctl dispatch bringactivetotop"
          "SUPER SHIFT, X, exec, hyprpicker -a -n"
          "CTRL ALT, L, exec, hyprlock"
          #"SUPER SHIFT, Return, exec, alacritty -e fish"
          "SUPER, Return, exec, alacritty"
          "SUPER, E, exec, nemo"
          "SUPER, D, exec, wofi --show drun --allow-images"
          "SUPER, period, exec, wofi-emoji"
          "SUPER, N, exec, swaync-client -t -sw"
          "SUPER, M, exec, wlogout --protocol layer-shell"
          "SUPER SHIFT, M, exit,"
          ", Print, exec, grimblast --notify --cursor copysave output"
          "ALT, Print, exec, grimblast --notify --cursor copysave screen"
          "SUPER, Q, killactive,"
          "SUPER SHIFT, Q, exit,"
          "SUPER, F, fullscreen,"
          "SUPER, Space, togglefloating,"
          "SUPER, P, pseudo, "
          "SUPER, S, togglesplit, "
          "SUPER, left, movefocus, l"
          "SUPER, right, movefocus, r"
          "SUPER, up, movefocus, u"
          "SUPER, down, movefocus, d"
          "SUPER SHIFT, left, movewindow, l"
          "SUPER SHIFT, right, movewindow, r"
          "SUPER SHIFT, up, movewindow, u"
          "SUPER SHIFT, down, movewindow, d"
          "SUPER CTRL, left, resizeactive, -20 0"
          "SUPER CTRL, right, resizeactive, 20 0"
          "SUPER CTRL, up, resizeactive, 0 -20"
          "SUPER CTRL, down, resizeactive, 0 20"
          "SUPER, g, togglegroup,"
          "SUPER, tab, changegroupactive,"
          "SUPER, grave, togglespecialworkspace,"
          "SUPERSHIFT, grave, movetoworkspace, special"
          #"SUPER, O, hyprexpo:expo, toggle"
          "SUPER ALT, up, workspace, e+1"
          "SUPER ALT, down, workspace, e-1"
          "SUPER, mouse_down, workspace, e+1"
          "SUPER, mouse_up, workspace, e-1"
          "ALT, Tab, cyclenext"
          "ALT, Tab, bringactivetotop"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "SUPER, code:1${toString i}, workspace, ${toString ws}"
                "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

      binde = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindle = [
        ", code:233, exec, brightnessctl -q s 2%+"
        ", code:232, exec, brightnessctl -q s 2%-"
      ];
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };

  services.udiskie = {
    enable = true;
    tray = "always";
  };

  home.packages = with pkgs; [
    nemo-with-extensions
    copyq
    ffmpegthumbnailer
    grimblast
    gsettings-desktop-schemas
    hyprpicker
    hyprsysteminfo
    hyprpolkitagent
    libsForQt5.filelight
    libsForQt5.qt5.qtwayland
    networkmanagerapplet
    pamixer
    pavucontrol
    qt6.qtwayland
    shotman
    slurp
    sov
    squeekboard # virtual keyboard
    swayosd
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wlsunset
    wofi-emoji
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
