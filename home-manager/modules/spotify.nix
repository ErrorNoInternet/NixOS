{ spicePkgs, ... }:

{
    programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.Nord;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
            fullAppDisplay
        ];
    };
}
