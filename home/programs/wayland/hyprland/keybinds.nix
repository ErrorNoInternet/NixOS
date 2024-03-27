{
  config,
  inputs',
  self',
  ...
}: {
  wayland.windowManager.hyprland = let
    grimblast = "grimblast --freeze save area -";
    hyprgamemode = "${self'.packages.hyprgamemode}/bin/hyprgamemode";
    rofi = "rofi -modes drun,window,run -show drun";
    satty = "satty -f- --early-exit --copy-command wl-copy --init-tool rectangle";
    shadower = "${inputs'.shadower.packages.shadower}/bin/shadower -r16";
  in {
    settings = {
      bind =
        [
          "$mod CTRL SHIFT, code:22, exec, hyprctl dispatch exit"
          "$mod, escape, exec, wleave -p layer-shell -f -b5 -T425 -B425 -L250 -R250"

          "$mod, D, exec, ${rofi} || pkill rofi"
          "$mod, G, exec, cliphist list | (rofi -dmenu || pkill rofi) | cliphist decode | wl-copy"
          "$mod, code:60, exec, rofi -show emoji || pkill rofi"

          ", PRINT, exec, ${grimblast} | wl-copy"
          "SHIFT, PRINT, exec, ${grimblast} | ${shadower} | wl-copy"
          "CTRL, PRINT, exec, ${grimblast} | ${satty}"
          "CTRL SHIFT, PRINT, exec, ${grimblast} | ${shadower} | ${satty} | wl-copy"

          "$mod, F1, exec, ${hyprgamemode}"
          "$mod, L, exec, swaylock --grace 0 --fade-in 1"
          "$mod, A, exec, scratchpad"
          "$mod SHIFT, A, exec, scratchpad -g"
          "$mod, O, exec, swaync-client -t"
          "$mod, RETURN, exec, ${config.terminal.command}"
          "$mod, code:51, exec, firefox"
          "$mod SHIFT, RETURN, exec, [float; center] ${config.terminal.command}"

          "$mod SHIFT, F, fullscreen"
          "$mod, F, fullscreen, 1"
          "$mod, Q, killactive"
          "$mod, T, togglegroup"
          "$mod, V, togglefloating"
          "$mod, W, togglesplit"

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

          "$mod, TAB, workspace, previous"
          "$mod SHIFT, TAB, movetoworkspace, previous"

          "$mod, mouse_down, workspace, e-1"
          "$mod, mouse_up, workspace, e+1"
        ]
        ++ builtins.concatLists (builtins.genList (n: let
            key =
              if n == 9
              then "0"
              else builtins.toString (n + 1);
            workspace = builtins.toString (n + 1);
          in [
            "$mod, ${key}, workspace, ${workspace}"
            "$mod SHIFT, ${key}, movetoworkspace, ${workspace}"
          ])
          10);
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindle = [
        ",XF86AudioMute, exec, pavolume toggle"
        ",XF86AudioRaiseVolume, exec, pavolume up"
        ",XF86AudioLowerVolume, exec, pavolume down"
        ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
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
