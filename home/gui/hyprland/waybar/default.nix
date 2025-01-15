{
  lib,
  pkgs,
  ...
}: {
  systemd.user.services.waybar.Unit.After = lib.mkForce "graphical-session.target";
  # Config inspired *ekchem* stolen *ekchem* from https://github.com/Sejjy/MechaBar/tree/626ed38662f18a7a44cb624a5b7a81ad0bbb17a8
  programs.waybar = {
    enable = true;
    style = ./style.css;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mode = "dock";
        height = 20;
        exclisove = true;
        passthrough = false;
        gtk-layer-shell = true;
        modules-left = [
          "custom/left1"
          "hyprland/workspaces"
          "custom/right1"

          "hyprland/window"
        ];
        modules-center = [
          "custom/left2"
          "tray"

          "custom/left3"
          "memory"

          "custom/left4"
          "cpu"
          "custom/leftin1"

          "custom/os-logo-left"
          "custom/os-logo"
          "custom/os-logo-right"

          "custom/rightin1"
          "clock#time"
          "custom/right3"

          "clock#date"
          "custom/right4"

          # "custom/wi"
          # "custom/wifi"
          "network"
          "custom/right5"
        ];
        modules-right = [
          # "custom/media"

          "custom/left6"
          "pulseaudio"

          "custom/left7"
          "backlight"

          "custom/left8"
          "battery"

          "custom/leftin2"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          all-outputs = false;
          active-only = false;
          on-click = "activate";
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
          sort-by-number = true;
        };
        "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
          rewrite = {
            # "sejjy@archlinux:(.*)" = "  $1";
            # "(.*)sejjy@archlinux:~" = "  sejjy@archlinux";
            # "(.*) — Mozilla Firefox" = "<span foreground='#f38ba8'>󰈹</span>  $1";
            # "(.*)Mozilla Firefox" = "<span foreground='#f38ba8'>󰈹</span>  Firefox";
            # "(.*) - Visual Studio Code" = "<span foreground='#89b4fa'>󰨞</span>  $1";
            # "(.*)Visual Studio Code" = "<span foreground='#89b4fa'>󰨞</span>  Visual Studio Code";
            # "(.*)Spotify" = "<span foreground='#a6e3a1'></span>  Spotify";
            # "(.*)Spotify Premium" = "<span foreground='#a6e3a1'></span>  Spotify Premium";
            # "Discord" = "<span foreground='#89b4fa'></span>  Discord";
            # "GNU Image Manipulation Program" = "<span foreground='#a6adc8'></span>  GNU Image Manipulation Program";
            # "OBS(.*)" = "<span foreground='#a6adc8'>󰐌</span>  OBS Studio";
            # "VLC media player" = "<span foreground='#fab387'>󰕼</span>  VLC Media Player";
            # "ONLYOFFICE Desktop Editors" = "<span foreground='#f38ba8'></span>  OnlyOffice Desktop";
            # "qView" = "  qView";
            # "(.*).jpg" = "  $1.jpg";
            # "(.*).png" = "  $1.png";
            # "(.*).svg" = "  $1.svg";
            # "/" = "  File Manager";
            # "" = "<span foreground='#cba6f7'></span>  Sejjy 󰅂 Hyprland";
          };
          min-length = 5;
          max-length = 45;
        };
        memory = {
          states = {
            "c" = 90;
          };
          format = "󰘚 {percentage}%";
          format-c = "󰀪 {percentage}%";
          tooltip = true;
          tooltip-format = "{used:0.1f}G/{total:0.1f}G ";
          interval = 20;
          min-length = 7;
          max-length = 7;
        };
        cpu = {
          format = "  {usage}%";
          tooltip = false;
          interval = 5;
          min-length = 6;
          max-length = 6;
        };
        "custom/os-logo" = {
          format = " ";
          tooltip = false;
        };

        tray = {
          max-length = 20;
          min-length = 20;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%)  ";
          format-ethernet = "{ipaddr}/{cidr} 󰊗 ";
          tooltip-format = "{ifname} via {gwaddr} 󰊗 ";
          tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
          tooltip-format-ethernet = "{ifname}  ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 20;
          min-length = 20;
        };

        "clock#time" = {
          timezone = "Europe/Warsaw";
          format = "󱑂 {:%H:%M}";
          tooltip = true;
          tooltip-format = "{:%I:%M %p}";
          min-length = 8;
          max-length = 8;
        };

        "clock#date" = {
          timezone = "Europe/Warsaw";
          format = "󱨴 {:%d-%m}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
            format = {
              months = "<span color='#f5e0dc'><b>{}</b></span>";
              weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b>{}</b></span>";
            };
          };
          action = {
            on-clock-right = "mode";
          };
          min-length = 8;
          max-length = 8;
        };
        "custom/wi" = {
          format = "󰤥 ";
          tooltip = false;
        };
        "custom/wifi" = {
          format = "Wi-Fi";
          min-length = 7;
          max-length = 7;
        };
        "custom/media" = {
          min-length = 5;
          max-length = 35;
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "婢 {volume}%";
          format-icons = {
            headphone = "󰋋";
            default = ["󰖀" "󰕾"];
          };
          on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          # "on-click" = "~/.config/waybar/scripts/volumecontrol.sh -o m";
          # "on-click-right" = "pavucontrol -t 3";
          # "on-scroll-up" = "~/.config/waybar/scripts/volumecontrol.sh -o i";
          # "on-scroll-down" = "~/.config/waybar/scripts/volumecontrol.sh -o d";
          # "scroll-step" = 10;
          min-length = 6;
          max-length = 6;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = true;
          # "tooltip-format" = "Brightness";
          # "on-scroll-up" = "brightnessctl set 5%+";
          # "on-scroll-down" = "brightnessctl set 5%-";
          min-length = 6;
          max-length = 6;
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = "󱘖 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          tooltip-format = "{timeTo}";
          interval = 1;
          min-length = 6;
          max-length = 6;
        };

        "custom/power" = {
          format = " ";
          tooltip = false;
          on-click = "${pkgs.wlogout}/bin/wlogout";
          # "on-click-right" = "~/.config/waybar/scripts/logoutlaunch.sh 1";
          # "interval"  = 86400;
        };

        # Left Arrows
        "custom/left1" = {
          format = "";
          tooltip = false;
        };
        "custom/left2" = {
          format = "";
          tooltip = false;
        };
        "custom/left3" = {
          format = "";
          tooltip = false;
        };
        "custom/left4" = {
          format = "";
          tooltip = false;
        };
        "custom/os-logo-left" = {
          format = "";
          tooltip = false;
        };
        "custom/left6" = {
          format = "";
          tooltip = false;
        };
        "custom/left7" = {
          format = "";
          tooltip = false;
        };
        "custom/left8" = {
          format = "";
          tooltip = false;
        };

        # Right Arrows
        "custom/right1" = {
          format = "";
          tooltip = false;
        };
        "custom/os-logo-right" = {
          format = "";
          tooltip = false;
        };
        "custom/right3" = {
          format = "";
          tooltip = false;
        };
        "custom/right4" = {
          format = "";
          tooltip = false;
        };
        "custom/right5" = {
          format = "";
          tooltip = false;
        };

        # Left Inverse
        "custom/leftin1" = {
          format = "";
          tooltip = false;
        };
        "custom/leftin2" = {
          format = "";
          tooltip = false;
        };

        # Right Inverse
        "custom/rightin1" = {
          format = "";
          tooltip = false;
        };

        #         "temperature": {
        #     // "thermal-zone": 2,
        #     // "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
        #     "critical-threshold": 80,
        #     // "format-critical": "{temperatureC}°C {icon}",
        #     "format": "{temperatureC}°C {icon}",
        #     "format-icons": ["", "", ""]
        # },
        # "backlight": {
        #     // "device": "acpi_video1",
        #     "format": "{percent}% {icon}",
        #     "format-icons": ["", "", "", "", "", "", "", "", ""]
        # },
        # "battery": {
        #     "states": {
        #         // "good": 95,
        #         "warning": 30,
        #         "critical": 15
        #     },
        #     "format": "{capacity}% {icon}",
        #     "format-full": "{capacity}% {icon}",
        #     "format-charging": "{capacity}% ",
        #     "format-plugged": "{capacity}% ",
        #     "format-alt": "{time} {icon}",
        #     // "format-good": "", // An empty format will hide the module
        #     // "format-full": "",
        #     "format-icons": ["", "", "", "", ""]
        # },
        # "battery#bat2": {
        #     "bat": "BAT2"
        # },
        # "power-profiles-daemon": {
        #   "format": "{icon}",
        #   "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
        #   "tooltip": true,
        #   "format-icons": {
        #     "default": "",
        #     "performance": "",
        #     "balanced": "",
        #     "power-saver": ""
        #   }
        # },
        # "network": {
        #     // "interface": "wlp2*", // (Optional) To force the use of this interface
        #     "format-wifi": "{essid} ({signalStrength}%) ",
        #     "format-ethernet": "{ipaddr}/{cidr} ",
        #     "tooltip-format": "{ifname} via {gwaddr} ",
        #     "format-linked": "{ifname} (No IP) ",
        #     "format-disconnected": "Disconnected ⚠",
        #     "format-alt": "{ifname}: {ipaddr}/{cidr}"
        # },
        # "pulseaudio": {
        #     // "scroll-step": 1, // %, can be a float
        #     "format": "{volume}% {icon} {format_source}",
        #     "format-bluetooth": "{volume}% {icon} {format_source}",
        #     "format-bluetooth-muted": " {icon} {format_source}",
        #     "format-muted": " {format_source}",
        #     "format-source": "{volume}% ",
        #     "format-source-muted": "",
        #     "format-icons": {
        #         "headphone": "",
        #         "hands-free": "",
        #         "headset": "",
        #         "phone": "",
        #         "portable": "",
        #         "car": "",
        #         "default": ["", "", ""]
        #     },
        #     "on-click": "pavucontrol"
        # },
        # "custom/media": {
        #     "format": "{icon} {}",
        #     "return-type": "json",
        #     "max-length": 40,
        #     "format-icons": {
        #         "spotify": "",
        #         "default": "🎜"
        #     },
        #     "escape": true,
        #     "exec": "$HOME/.config/waybar/mediaplayer.py 2> /dev/null" // Script in resources folder
        #     // "exec": "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
        # }
      };
    };
  };
}
