{config, ...}: let
  dialogs = [
    "class:blueman-manager"
    "class:xdg-desktop-portal"
    "title:File Upload"
    "title:Open"
    "title:Save As"
  ];
  floats = [
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
      "size 50% 55%, class:${config.terminal.name}"
    ]
    ++ (map (float: "float, ${float}") floats)
    ++ builtins.concatLists (map (dialog: [
        "animation slide, ${dialog}"
        "center,          ${dialog}"
        "float,           ${dialog}"
        "size 60% 65%,    ${dialog}"
      ])
      dialogs);
}
