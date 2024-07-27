{
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        position = "top";
        spacing = 4;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"

        ];
        clock = {
          timezone = "Europe/Warsaw";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt= "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{used:0.1f}G/{total:0.1f}G ";
        };
        "hyprland/workspaces" = {
          format = "{id}{windows}";
          window-rewrite-default = "󰣆";
          window-rewrite = {
            "class<VSCodium>" = "";
            "class<Firefox>" = "";
            "class<Alacritty>" = "";
          };
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