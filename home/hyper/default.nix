{
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
  ];

   services.hypridle = {
    enable = true;
    settings = {
      general = { ignore_dbus_inhibit = false; };
      listener = [{
        timeout = 600;
        on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
      }];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
        no_fade_in = true;
        no_fade_out = true;
      };

      background = {
        monitor = "";

        blur_size = 4;
        blur_passes = 3;
        noise = 1.17e-2;
        contrast = 1.3;
        brightness = 0.8;
        vibrancy = 0.21;
        vibrancy_darkness = 0.0;
      };

      input-field = [{
        monitor = "";
        size = "250, 50";
        outline_thickness = 3;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        fade_on_empty = true;
        placeholder_text =
          "Password..."; # Text rendered in the input box when it's empty.
        position = "0, 80";
        halign = "center";
        valign = "bottom";
      }];

      label = [
        # Current time
        {
          monitor = "";
          text =
            ''cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"'';
          font_size = 64;
          position = "0, 16";
          halign = "center";
          valign = "center";
        }
        # User label
        {
          monitor = "";
          text = ''
            Hey <span text_transform="capitalize" size="larger">$USER</span>'';
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        # Type to unlock
        {
          monitor = "";
          text = "Type to unlock!";
          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}