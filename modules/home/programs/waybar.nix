{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "custom/launcher"
          "cpu"
          "memory"
          "temperature"
          "backlight"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "bluetooth"
          "network"
          "battery"
          "pulseaudio"
          "custom/power"
        ];

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = ''
            choice=$(printf " Shutdown\n Reboot\n Suspend\n Lock" | wofi --dmenu --width 200 --height 200)
            case "$choice" in
              " Shutdown") systemctl poweroff ;;
              " Reboot") systemctl reboot ;;
              " Suspend") systemctl suspend ;;
              " Lock") swaylock --color 000000 ;;
            esac
          '';
        };

        "custom/launcher" = {
          format = "";
          on-click = "fuzzel --show drun";
          tooltip = false;
        };

        cpu = {
          format = " {usage}%";
        };

        memory = {
          interval = 3;
          format = " {used}G";
        };

        temperature = {
          critical-threshold = 65;
          hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
          interval = 30;
          format = " {temperatureC}°C";
          tooltip = false;
        };

        clock = {
          format = "  {:%Y-%m-%d %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          timezone = "Europe/Helsinki";

          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click" = "mode";

            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };

          actions = {
            on-click = "mode";
          };
        };

        bluetooth = {
          format = " {status}";
          format-on = "";
          format-off = "󰂲";
          format-disabled = " Disabled";
          format-connected = " {device_alias}";

          "tooltip-format-off" = "{status}";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\t{device_address}\t{device_battery_percentage}%";

          max-length = 10;

          on-click = "blueman-manager";
        };

        network = {
          format-wifi = "  ({signalStrength}%)";
          format-ethernet = "󰈀 {ifname}";
          format-disconnected = "󰤮 Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        battery = {
          states = {
            good = 85;
            medium = 65;
            low = 30;
          };

          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";

          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];

          tooltip-format = ''
            Power Draw: {power}W
            Remaining time: {time}
            Health: {health}
          '';
        };

        backlight = {
          format = "󰃠 {}%";
          "on-scroll-up" = "brightnessctl s 1%-";
          "on-scroll-down" = "brightnessctl s +1%";
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-muted = "󰝟 0%";

          states = {
            muted = 0;
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "format-icons" = {
            default = [
              ""
              "󰕾"
              " "
            ];
          };
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "FiraMono Nerd Font";
        font-size: 16px;
      }

      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #cpu,
      #memory,
      #clock,
      #bluetooth,
      #network,
      #backlight,
      #battery {
          padding: 0 10px;
      }

      #backlight {
        color: yellow;
      }

      #pulseaudio {
        color: #b0fc38;
        margin-left: 8px;
        margin-right: 8px;
      }

      #custom-launcher {
        font-size: 26px;
        color: #59acff;
        padding-left: 8px;
        padding-right: 16px;
        border-radius: 4px;
        background: #372736;
      }

      #custom-power {
        font-size: 28px;
        margin-left: 8px;
        margin-right: 4px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 30%;
        color: white;
        background: red;
      }

      @keyframes blink {
        to {
          color: #ffffff;
        }
      }

      #battery {
        color: #3ded97;
      }

      #battery.low {
        color: red;
      }

      #battery.charging,
      #battery.plugged {
        color: #59acff;
      }

      #battery.low:not(.charging) {
        animation-name: blink;
        animation-duration: 1.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #bluetooth {
        color: #89b4fa;
      }
    '';
  };
}
