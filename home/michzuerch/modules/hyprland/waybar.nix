{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = ["idle_inhibitor" "hyprland/workspaces"];
        modules-center = [];
        modules-right = ["pulseaudio" "backlight" "cpu" "memory" "network" "bluetooth" "battery" "clock" "custom/power" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          on-click = "activate";
          format = "{id}";
          persistent-workspaces = {
            "*" = 3;
          };
        };

        clock = {
          format = " {:%a, %d %b, %I:%M %p}";
          locale = "de_DE.UTF-8";
          timezone = "Europe/Busingen";
          tooltip = "true";
          tooltip-format = "{calendar}";
          format-alt = "{:%I:%M %p}";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              today = "<span color='yellow'>{}</span>";
            };
          };
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% 󰂯";
          format-muted = "󰝟";
          format-icons = {
            "headphones" = "󰋋";
            "handsfree" = "󰋎";
            "headset" = "󰋎";
            "phone" = "󰣏";
            "portable" = "󰣏";
            "car" = "󰄜";
            "default" = ["󰕿" "󰖀"];
          };
          on-click = "pavucontrol";
        };
        memory = {
          interval = 1;
          format = "󰻠 {percentage}%";
          states = {
            warning = 85;
          };
        };
        cpu = {
          interval = 1;
          format = "󰍛 {usage}%";
        };

        backlight = {
          format = " {icon} {percent} ";
          format-icons = ["󰃟"];
          on-scroll-up = "brightnessctl set +10%";
          on-scroll-down = "brightnessctl set 10%-";
          on-click = "brightnessctl set 0";
          tooltip = false;
        };
        bluetooth = {
          format-disabled = "   ";
          format-off = "   ";
          format-on = " 󰂯 ";
          format-connected = " 󰂯 ";
          format-connected-battery = " 󰂯 ";
          tooltip-format-connected = " {device_alias} 󰂄{device_battery_percentage} ";
          on-click = "blueberry";
          tooltip = true;
        };
        network = {
          format-disconnected = "󰯡 Disconnected";
          format-ethernet = "󰒢 Connected!";
          format-linked = "󰖪 {essid} (No IP)";
          format-wifi = "󰖩 {essid}";
          interval = 1;
          tooltip = true;
          format-alt = "󰅢 {bandwidthDownBytes} /  {bandwidthUpBytes} ";
        };
        "custom/weather" = {
          format = "{} °";
          tooltip = true;
          interval = 3600;
          exec = "wttrbar --location Radolfzell";
          "return-type" = "json";
        };
        idle_inhibitor = {
          format = "{icon}";
          "format-icons" = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
          tooltip = false;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        "custom/power" = {
          format = "⏻";
          tooltip = true;
          tooltip-format = "Power Menu";
          on-click = "wlogout";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    pamixer
    pavucontrol
    wttrbar
  ];
}
