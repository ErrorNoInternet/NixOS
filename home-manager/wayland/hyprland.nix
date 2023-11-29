{
  config,
  custom,
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {
      "$mainMod" = "ALT";
      env = [
        #  "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        #  "__NV_PRIME_RENDER_OFFLOAD,1"
        #  "__NV_PRIME_RENDER_OFFLOAD_PROVIDER,NVIDIA-G0"
        #  "__VK_LAYER_NV_optimus,NVIDIA_only"
        #  "GBM_BACKEND,nvidia-drm"
        #  "LIBVA_DRIVER_NAME,nvidia"
        #  "WLR_DRM_DEVICES,/dev/dri/card1"
        #  "WLR_NO_HARDWARE_CURSORS,1"
        #  "XDG_SESSION_TYPE,wayland"
      ];
      monitor = [
        "eDP-1,1920x1080@60,1680x0,1"
        "VGA-1,1680x1050@60,0x0,1"
        ",preferred,auto,auto"
      ];
      exec-once = [
        "hyprpaper"
        "hyprctl setcursor ${custom.pointerCursor.name} ${builtins.toString custom.pointerCursor.size}"
        "swayidle -w timeout 600 'custom-swaylock 10 10' before-sleep 'custom-swaylock 0 1'"
        "hyprland-autoname-workspaces"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      input = {
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
        kb_layout = "us";
        follow_mouse = 1;
        accel_profile = "flat";
        sensitivity = 0.8;
        repeat_delay = 200;
        repeat_rate = 45;
      };
      general = {
        gaps_in = 6;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${config.colorScheme.colors.base0D})";
        "col.inactive_border" = "rgb(${config.colorScheme.colors.base03})";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        drop_shadow = true;
        shadow_range = 25;
        shadow_render_power = 2;
        "col.shadow" = "rgb(${config.colorScheme.colors.base00})";
        blur = {
          enabled = true;
          passes = 2;
          size = 10;
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
      };
      binds = {
        allow_workspace_cycles = true;
      };
      bind = [
        "$mainMod, D, exec, rofi -show drun || pkill rofi"
        "$mainMod, Z, exec, rofi -show drun || pkill rofi"
        "$mainMod, S, exec, scratchpad"
        "$mainMod SHIFT, S, exec, scratchpad -g"
        "$mainMod, G, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, code:60, exec, rofi -show emoji"
        ", PRINT, exec, grimblast --freeze copy area"

        "$mainMod, L, exec, custom-swaylock 0 1"
        "$mainMod, RETURN, exec, ${custom.terminal}"
        "$mainMod SHIFT, RETURN, exec, ${custom.terminalFloating}"

        "$mainMod, TAB, workspace, previous"
        "$mainMod SHIFT, F, fullscreen"
        "$mainMod, F, fullscreen, 1"
        "$mainMod, V, togglefloating"
        "$mainMod, W, togglesplit"
        "$mainMod SHIFT, Q, killactive"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
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
        "float           ,class:floating"
        "float           ,class:(branchdialog)"
        "float           ,class:(confirm)"
        "float           ,class:(dialog)"
        "float           ,class:(error)"
        "float           ,class:(notification)"
        "float           ,class:(pavucontrol)"
        "float           ,title:(mpv)"
        "size 1200 750   ,class:(xdg-desktop-portal-gtk)"
        "float           ,class:(xdg-desktop-portal-gtk)"
        "center          ,class:(xdg-desktop-portal-gtk)"
        "animation slide ,class:(xdg-desktop-portal-gtk)"

        "opacity ${custom.subtleOpacity} ${custom.subtleOpacity},class:^(discord)$"
      ];
    };
    extraConfig = ''
      bind=$mainMod,R,submap,resize
      submap=resize

      binde=,left,resizeactive,-25 0
      binde=,right,resizeactive,25 0
      binde=,up,resizeactive,0 -25
      binde=,down,resizeactive,0 25
      binde=,H,resizeactive,-25 0
      binde=,L,resizeactive,25 0
      binde=,K,resizeactive,0 -25
      binde=,J,resizeactive,0 25

      bind=,escape,submap,reset
      bind=$mainMod,R,submap,reset
      submap=reset

      layerrule=blur,waybar
    '';
  };
}
