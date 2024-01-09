{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
with config.colorScheme.colors; {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      "$mod" = config.desktop.modifierKey;
      monitor =
        map (
          defined: let
            resolution =
              if defined.width == null || defined.height == null
              then "preferred"
              else "${builtins.toString defined.width}${builtins.toString defined.height}@${
                builtins.toString (
                  if defined.refreshRate == 0
                  then 60
                  else defined.refreshRate
                )
              }";
            position = "${builtins.toString defined.x}x${builtins.toString defined.y}";
          in "${defined.name},${
            if defined.enabled
            then "${resolution},${position},${builtins.toString defined.scale}"
            else "disable"
          }"
        )
        (config.desktop.monitors);
      exec-once = [
        "sleep 0.5 && ${lib.getExe pkgs.waybar}"
        (lib.mkIf config.wallpaper.enable "${lib.getExe pkgs.hyprpaper}")
        "hyprctl setcursor ${config.cursor.name} ${builtins.toString config.cursor.size}"
        "swayidle -w timeout 570 'swaylock --grace 30 --fade-in 30' before-sleep 'swaylock --grace 0 --fade-in 1'"
        "swayidle -w timeout 1200 'hyprctl dispatch dpms off'"
        "${lib.getExe pkgs.hyprland-autoname-workspaces}"
        "${pkgs.wl-clipboard}/bin/wl-paste --watch ${lib.getExe pkgs.cliphist} -max-items 1000 store"
      ];
      input = {
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
        kb_layout = "us";
        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0.75;
        repeat_delay = 200;
        repeat_rate = 45;
      };
      general = {
        gaps_in = 6;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${base0D})";
        "col.inactive_border" = "rgb(${base03})";
        layout = "dwindle";
      };
      group = {
        "col.border_active" = "rgb(${base0D})";
        "col.border_inactive" = "rgb(${base03})";
        "col.border_locked_active" = "rgb(${base0F})";
        "col.border_locked_inactive" = "rgb(${base03})";
        groupbar = {
          gradients = false;
          render_titles = false;
          "col.active" = "rgb(${base0D})";
          "col.inactive" = "rgb(${base03})";
          "col.locked_active" = "rgb(${base0F})";
          "col.locked_inactive" = "rgb(${base03})";
        };
      };
      decoration = {
        rounding = 10;
        drop_shadow = true;
        shadow_range = 25;
        shadow_render_power = 2;
        "col.shadow" = "rgb(${base00})";
        blur = {
          enabled = true;
          passes = 3;
          size = 8;
        };
      };
      animations = {
        enabled = true;
        bezier = "customBezier, 0.05, 0.9, 0.1, 1.00";
        animation = [
          "windows, 1, 5, customBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 5, default"
          "borderangle, 1, 5, default"
          "fade, 1, 5, default"
          "workspaces, 1, 5, customBezier"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = true;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
      binds = {
        allow_workspace_cycles = true;
      };
      bind = [
        "$mod CTRL SHIFT, code:22, exec, hyprctl dispatch exit"
        "$mod, escape, exec, wleave -p layer-shell -f -m 300"

        "$mod, D, exec, rofi -show drun || pkill rofi"
        "$mod, Z, exec, rofi -show drun || pkill rofi"
        "$mod, G, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, code:60, exec, rofi -show emoji"
        ", PRINT, exec, grimblast --freeze save area - | wl-copy"
        "SHIFT, PRINT, exec, grimblast --freeze save area - | shadower -r12 | wl-copy"

        "$mod, F1, exec, hyprgamemode"
        "$mod, L, exec, swaylock --grace 0 --fade-in 1"
        "$mod, S, exec, scratchpad"
        "$mod SHIFT, S, exec, scratchpad -g"
        "$mod, RETURN, exec, ${config.terminal.name}"
        "$mod SHIFT, RETURN, exec, [float; center] ${config.terminal.name}"

        "$mod, TAB, workspace, previous"
        "$mod SHIFT, F, fullscreen"
        "$mod, F, fullscreen, 1"
        "$mod, V, togglefloating"
        "$mod, W, togglesplit"
        "$mod, T, togglegroup"
        "$mod SHIFT, Q, killactive"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        "$mod CTRL, left, changegroupactive, b"
        "$mod CTRL, right, changegroupactive, f"
        "$mod SHIFT, T, lockgroups, toggle"
        "$mod CTRL SHIFT, left, movewindoworgroup, l"
        "$mod CTRL SHIFT, right, movewindoworgroup, r"
        "$mod CTRL SHIFT, up, movewindoworgroup, u"
        "$mod CTRL SHIFT, down, movewindoworgroup, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindle = [
        ",XF86AudioMute, exec, pavolume toggle"
        ",XF86AudioRaiseVolume, exec, pavolume up"
        ",XF86AudioLowerVolume, exec, pavolume down"
        ",XF86MonBrightnessUp, exec, brightness up"
        ",XF86MonBrightnessDown, exec, brightness down"
      ];
      bindl = [
        ",switch:on:Lid Switch, exec, swaylock 0 1"
        ",switch:off:Lid Switch, exec, swaylock 0 1"
      ];
      windowrulev2 = [
        "float           ,class:(branchdialog)"
        "float           ,class:(confirm)"
        "float           ,class:(dialog)"
        "float           ,class:(error)"
        "float           ,class:(mpv)"
        "float           ,class:(notification)"
        "float           ,class:(pavucontrol)"
        "float           ,class:(vimiv)"
        "size 50% 55%    ,class:(foot)"

        "animation slide ,class:(xdg-desktop-portal-gtk)"
        "center          ,class:(xdg-desktop-portal-gtk)"
        "float           ,class:(xdg-desktop-portal-gtk)"
        "size 60% 65%    ,class:(xdg-desktop-portal-gtk)"

        "animation slide ,title:(File Upload)"
        "center          ,title:(File Upload)"
        "float           ,title:(File Upload)"
        "size 60% 65%    ,title:(File Upload)"

        "animation slide ,title:(Open)"
        "center          ,title:(Open)"
        "float           ,title:(Open)"
        "size 60% 65%    ,title:(Open)"

        "animation slide ,title:(Save As)"
        "center          ,title:(Save As)"
        "float           ,title:(Save As)"
        "size 60% 65%    ,title:(Save As)"
      ];
    };
    extraConfig = ''
      bind=$mod CTRL SHIFT, escape, submap, clean
      submap=clean
      bind=$mod CTRL SHIFT, escape, submap, reset
      submap=reset

      bind=$mod,R,submap,resize
      submap=resize
      binde=,left,resizeactive,-40 0
      binde=,right,resizeactive,40 0
      binde=,up,resizeactive,0 -40
      binde=,down,resizeactive,0 40
      binde=,H,resizeactive,-40 0
      binde=,L,resizeactive,40 0
      binde=,K,resizeactive,0 -40
      binde=,J,resizeactive,0 40
      bind=,escape,submap,reset
      bind=$mod,R,submap,reset
      submap=reset

      layerrule=blur,waybar
      layerrule=blur,rofi
      layerrule=ignorezero,rofi
    '';
  };
}
