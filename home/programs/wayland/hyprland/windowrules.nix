{config, ...}: let
  dialogs = [
    "class:blueman-manager"
    "class:xdg-desktop-portal"
    "title:File Upload"
    "title:Open"
    "title:Save As"
  ];
  floating = [
    "class:branchdialog"
    "class:confirm"
    "class:dialog"
    "class:error"
    "class:mpv"
    "class:notification"
    "class:pavucontrol"
    "class:vimiv"
  ];
in {
  wayland.windowManager.hyprland.settings.windowrulev2 =
    [
      "float,        class:qalculate-gtk"
      "size 50% 55%, class:${config.terminal.name}"
      "size 720 540, class:qalculate-gtk"
    ]
    ++ (map (float: "float, ${float}") floating)
    ++ builtins.concatLists (map (dialog: [
        "animation slide, ${dialog}"
        "center,          ${dialog}"
        "float,           ${dialog}"
        "size 60% 65%,    ${dialog}"
      ])
      dialogs);
}
