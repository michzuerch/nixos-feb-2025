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
        modules-left = ["hyprland/workspaces"];
        modules-center = [];
        modules-right = ["pulseaudio" "battery" "clock" "custom/power" "trayt"];

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
          on-click = "rofi -show power-menu -modi power-menu:rofi-power-menu";
          on-click-right = "systemctl poweroff";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };

  # home.file.".config/waybar/style.css".text = ''
  #   * {
  #     border: none;
  #     border-radius: 0px;
  #     font-family: "JetBrains Mono";
  #     font-weight: bold;
  #     font-size: 16px;
  #     min-height: 0;
  #     color: #${colors.primary-pale};
  #     padding: 0px 5px;
  #   }

  #   window#waybar {
  #     background: transparent;
  #   }

  #   #workspaces {
  #     background: #${colors.mantle};
  #     padding: 5px;
  #     border-radius: 10px;
  #     margin: 12px 5px 0px 5px;
  #   }

  #   #workspaces button {
  #     background: transparent;
  #     border-radius: 20px;
  #   }

  #   #workspaces button:hover {
  #     background: #${colors.grey};
  #   }

  #   #workspaces button.active {
  #     background: #${colors.primary};
  #   }

  #   #workspaces button.active label {
  #     color: #${colors.mantle};
  #   }

  #   #clock, #battery, #pulseaudio, #tray, #custom-power {
  #     background: #${colors.mantle};
  #     border-radius: 10px;
  #     padding: 0px 10px;
  #     margin: 12px 5px 0px 5px;
  #     transition: all 0.2s ease-in-out;
  #   }

  #   #tray {
  #     margin-right: 7px;
  #   }

  #   #clock:hover,
  #   #battery:hover,
  #   #pulseaudio:hover,
  #   #tray:hover,
  #   #custom-power:hover {
  #     background: #${colors.primary};
  #     color: #${colors.mantle};
  #   }
  # '';

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    pamixer
    pavucontrol
    wttrbar
  ];
}
