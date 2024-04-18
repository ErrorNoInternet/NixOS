{vesktop, ...}:
vesktop.overrideAttrs (old: {
  patches =
    (old.patches or [])
    ++ [
      ./fix-readonly.patch
      ./remove-splash.patch
      ./tray-notifications.patch
    ];
})
