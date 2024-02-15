{
  config,
  inputs',
  self',
  ...
}: {
  wayland.windowManager.hyprland = let
    commands = {
      brightness = "${self'.packages.brightness}/bin/brightness";
      grimblast = "grimblast --freeze save area -";
      hyprgamemode = "${self'.packages.hyprgamemode}/bin/hyprgamemode";
      rofi = "rofi -modes drun,window,run -show drun";
      satty = "satty -f- --early-exit --copy-command wl-copy --init-tool rectangle";
      shadower = "${inputs'.shadower.packages.shadower}/bin/shadower -r12";
    };
  in {
    settings = {
      bind = [
        "$mod CTRL SHIFT, code:22, exec, hyprctl dispatch exit"
        "$mod, escape, exec, wleave -p layer-shell -f -b5 -T425 -B425 -L250 -R250"

        "$mod, D, exec, ${commands.rofi} || pkill rofi"
        "$mod, Z, exec, ${commands.rofi} || pkill rofi"
        "$mod, G, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, code:60, exec, rofi -show emoji"

        ", PRINT, exec, ${commands.grimblast} | wl-copy"
        "SHIFT, PRINT, exec, ${commands.grimblast} | ${commands.shadower} | wl-copy"
        "CTRL, PRINT, exec, ${commands.grimblast} | ${commands.satty}"

        "$mod, F1, exec, ${commands.hyprgamemode}"
        "$mod, L, exec, swaylock --grace 0 --fade-in 1"
        "$mod, A, exec, scratchpad"
        "$mod SHIFT, A, exec, scratchpad -g"
        "$mod, O, exec, swaync-client -t"
        "$mod, RETURN, exec, ${config.terminal.command}"
        "$mod SHIFT, RETURN, exec, [float; center] ${config.terminal.command}"

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
        ",XF86MonBrightnessUp, exec, ${commands.brightness} up"
        ",XF86MonBrightnessDown, exec, ${commands.brightness} down"
      ];
      bindl = [
        ",switch:on:Lid Switch, exec, swaylock --grace 0 --fade-in 1"
        ",switch:off:Lid Switch, exec, swaylock --grace 0 --fade-in 1"
      ];

      binds.allow_workspace_cycles = true;
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
    '';
  };
}
