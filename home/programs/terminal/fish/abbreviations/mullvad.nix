{
  programs.fish.shellAbbrs = {
    ml = "mullvad";
    mlc = "mullvad connect -w";
    mld = "mullvad disconnect -w";
    mle = "mullvad-exclude";
    mll = "mullvad relay set location";
    mlr = "mullvad reconnect -w";
    mls = "mullvad status -v";
    mlsl = "mullvad status -v listen";
    mlst = "mullvad split-tunnel";
    mlsta = "mullvad split-tunnel add";
    mlstc = "mullvad split-tunnel clear";
    mlstd = "mullvad split-tunnel delete";
    mlstl = "mullvad split-tunnel list";
  };
}
