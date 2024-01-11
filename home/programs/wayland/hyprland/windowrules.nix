let
  dialogs = [
    "class:(.blueman-manager-wrapped)"
    "class:(xdg-desktop-portal-gtk)"
    "title:(File Upload)"
    "title:(Open)"
    "title:(Save As)"
  ];
in {
  wayland.windowManager.hyprland.settings.windowrulev2 =
    [
      "float,        class:(branchdialog)"
      "float,        class:(confirm)"
      "float,        class:(dialog)"
      "float,        class:(error)"
      "float,        class:(mpv)"
      "float,        class:(notification)"
      "float,        class:(pavucontrol)"
      "float,        class:(vimiv)"
      "size 50% 55%, class:(foot)"
    ]
    ++ (map (dialog: "animation slide, ${dialog}") dialogs)
    ++ (map (dialog: "center,          ${dialog}") dialogs)
    ++ (map (dialog: "float,           ${dialog}") dialogs)
    ++ (map (dialog: "size 60% 65%,    ${dialog}") dialogs);
}
