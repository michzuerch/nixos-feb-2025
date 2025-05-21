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
        margin-left = 10;
        margin-right = 10;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        # modules-right = ["cpu" "memory" "network" "tray"];
        modules-right = ["cpu" "memory" "custom/weather" "idle_inhibitor" "custom/notification" "pulseaudio" "backlight" "network" "bluetooth" "battery" "clock" "tray" "custom/power"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            urgent = "";
            active = ""; # focused workspace on current monitor
            visible = ""; # focused workspace on other monitors
            default = "";
            empty = ""; # persistent (created by this plugin)
          };
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          on-click = "activate";
          # format = "{id}";
          persistent-workspaces = {
            "*" = 3;
          };
        };

        clock = {
          format = "{:%a, %d %b, %I:%M}";
          locale = "de_DE.UTF-8";
          timezone = "Europe/Busingen";
          tooltip = "true";
          tooltip-format = "{calendar}";
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
          format = " {icon}  {percent} ";
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
          format-disconnected = "󰯡  Disconnected";
          format-ethernet = "󰒢 Connected!";
          format-linked = "󰖪  {essid} (No IP)";
          format-wifi = "󰖩  {essid}";
          interval = 1;
          tooltip = true;
          format-alt = "󰅢  {bandwidthDownBytes} /   {bandwidthUpBytes} ";
        };
        "custom/weather" = {
          format = "{} °";
          tooltip = true;
          interval = 3600;
          exec = "wttrbar --location Radolfzell";
          "return-type" = "json";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            "dnd-notification" = " ";
            "dnd-none" = "󰂛";
            "inhibited-notification" = " ";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = " ";
            "dnd-inhibited-none" = " ";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
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
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-alt = "{time}  {icon}";
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
          spacing = 3;
        };
      };
    };
    style = ''
      @keyframes blink-warning {
      70% {
          color: white;
      }

      to {
          color: white;
          background-color: orange;
        }
      }

      @keyframes blink-critical {
      70% {
        color: white;
      }

      to {
          color: white;
          background-color: red;
        }
      }

      * {
          border: none;
          border-radius: 0;
          min-height: 0;
          margin: 0;
          padding: 0;
      }

      /* The whole bar */
      #waybar {
          background: #323232;
          color: white;
          font-family: Cantarell, Noto Sans, sans-serif;
          font-size: 13px;
      }

      /* Each module */
      #battery,
      #backlight,
      #bluetooth,
      #clock,
      #cpu,
      #custom-keyboard-layout,
      #custom-power,
      #custom-weather,
      #custom-notification,
      #idle-inhibitor,
      #cpu,
      #memory,
      #mode,
      #network,
      #pulseaudio,
      #temperature,
      #tray {
          padding-left: 10px;
          padding-right: 10px;
      }

      #battery {
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #battery.warning {
          color: orange;
      }

      #battery.critical {
          color: red;
      }

      #battery.warning.discharging {
          animation-name: blink-warning;
          animation-duration: 3s;
      }

      #battery.critical.discharging {
          animation-name: blink-critical;
          animation-duration: 2s;
      }

      #clock {
          font-weight: bold;
      }

      #cpu {
        /* No styles */
      }

      #cpu.warning {
          color: orange;
      }

      #cpu.critical {
          color: red;
      }

      #memory {
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #memory.warning {
          color: orange;
      }

      #memory.critical {
          color: red;
          animation-name: blink-critical;
          animation-duration: 2s;
      }

      #network {
          /* No styles */
      }

      #network.disconnected {
          color: orange;
      }

      #pulseaudio {
          /* No styles */
      }

      #pulseaudio.muted {
          /* No styles */
      }

      #temperature {
          /* No styles */
      }

      #temperature.critical {
          color: red;
      }

      #tray {
          /* No styles */
      }

      #window {
          font-weight: bold;
      }

      #workspaces button {
        border-top: 2px solid transparent;
        /* To compensate for the top border and still have vertical centering */
        padding-bottom: 2px;
        padding-left: 10px;
        padding-right: 10px;
        color: #888888;
      }

      #workspaces button.focused {
        border-color: #4c7899;
        color: white;
        background-color: #285577;
      }

      #workspaces button.urgent {
        border-color: #c9545d;
        color: #c9545d;
      }

    '';
  };

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    pamixer
    pavucontrol
    wttrbar
  ];
}
