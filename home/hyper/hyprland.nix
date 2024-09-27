{
  pkgs,
  ...
}: 
let 
  super = "SUPER";
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.dunst}/bin/dunst
  '';
in 
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "HDMI-A-1, 2160x1440@60, 0x0, 1"
        ",preferred,auto,auto"
      ];

      env = [
        "XCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "pl";
        # kb_variant = "qwertz";

        touchpad = {
            natural_scroll = "no";
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10;
        
        blur = {
            enabled = true;
            size = 3;
            passes = 1;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

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
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_status = "master";
      };

      gestures = {
          # See ttps://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = false;
      };

      misc = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = -1; # Set to 0 to disable the anime mascot wallpapers
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      # $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = [
        "${super}, Q, exec, alacritty"
        "${super}, C, killactive" 
        "${super}, M, exit"
        "${super}, E, exec, dolphin"
        "${super}, V, togglefloating"
        "${super}, R, exec, rofi -show drun -show-icons"
        "${super}, L, exec, pidof hyprlock || hyprlock --immediate"
        "${super}, P, pseudo" # dwindle
        "${super}, J, togglesplit" # dwindle

      # Move focus with mainMod + arrow keys
        "${super}, left, movefocus, l"
        "${super}, right, movefocus, r"
        "${super}, up, movefocus, u"
        "${super}, down, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
        "${super}, 1, workspace, 1"
        "${super}, 2, workspace, 2"
        "${super}, 3, workspace, 3"
        "${super}, 4, workspace, 4"
        "${super}, 5, workspace, 5"
        "${super}, 6, workspace, 6"
        "${super}, 7, workspace, 7"
        "${super}, 8, workspace, 8"
        "${super}, 9, workspace, 9"
        "${super}, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${super} SHIFT, 1, movetoworkspace, 1"
        "${super} SHIFT, 2, movetoworkspace, 2"
        "${super} SHIFT, 3, movetoworkspace, 3"
        "${super} SHIFT, 4, movetoworkspace, 4"
        "${super} SHIFT, 5, movetoworkspace, 5"
        "${super} SHIFT, 6, movetoworkspace, 6"
        "${super} SHIFT, 7, movetoworkspace, 7"
        "${super} SHIFT, 8, movetoworkspace, 8"
        "${super} SHIFT, 9, movetoworkspace, 9"
        "${super} SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
        "${super}, S, togglespecialworkspace, magic"
        "${super} SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
        "${super}, mouse_down, workspace, e+1"
        "${super}, mouse_up, workspace, e-1"
      ];
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm =  [
        "${super}, mouse:272, movewindow"
        "${super}, mouse:273, resizewindow"
      ];

      exec-once = ''${startupScript}/bin/start'';
    };
  };
}
