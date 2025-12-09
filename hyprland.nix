{ pkgs, ... }:
{
  wayland.windowManager.hyprland.enable = true;

  # Hint Electron apps to use Wayland
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.extraConfig = ''
    monitor=,preferred,auto,1
  '';

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    general = {
      gaps_in = 6;
      gaps_out = 6;
      border_size = 2;
      resize_on_border = true;
      layout = "dwindle";
      "col.active_border" = "rgb(e5e6e4) rgb(ffffff) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        ignore_opacity = false;
      };
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };

    bind = [
      "$mod, W, exec, google-chrome-stable"
      ", Print, exec, grimblast copy area"
      "$mod, Return, exec, ghostty"
      "$mod, K, exec, list-keybinds"
      "$mod SHIFT, Return, exec, rofi -show drun"
      "$mod, D, exec, discord"
      "$mod, Q, killactive"
      "$mod, F, fullscreen"
      "$mod SHIFT, C, exit"
      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"
      "$mod ALT, left, swapwindow, l"
      "$mod ALT, right, swapwindow, r"
      "$mod ALT, up, swapwindow, u"
      "$mod ALT, down, swapwindow, d"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"
      "$mod CONTROL, right, workspace, e+1"
      "$mod CONTROL, left, workspace, e-1"
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      )
      9)
    );

    exec-once = [
      "killall -q swww; sleep .5 && ${pkgs.swww}/bin/swww-daemon"
      "killall -q waybar; sleep .5 && ${pkgs.waybar}/bin/waybar"
      "killall -q dunst; sleep .5 && ${pkgs.dunst}/bin/dunst"
      "sleep 1.0 && ${pkgs.swww}/bin/swww img ${./terror.jpg}"
    ];
  };
}
