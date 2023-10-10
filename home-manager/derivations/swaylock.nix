{ custom, pkgs }:

pkgs.writeShellApplication {
    name = "custom-swaylock";
    runtimeInputs = [ pkgs.swaylock-effects ];
    text = ''
        swaylock \
            --indicator-radius 90 \
            --indicator-thickness 15 \
            --inside-color ${custom.dark1} \
            --inside-clear-color ${custom.dark1} \
            --inside-ver-color ${custom.dark1} \
            --inside-wrong-color ${custom.dark1} \
            --key-hl-color ${custom.green} \
            --bs-hl-color ${custom.orange} \
            --ring-color ${custom.dark4} \
            --ring-clear-color ${custom.yellow} \
            --ring-wrong-color ${custom.red} \
            --ring-ver-color ${custom.nord3} \
            --separator-color ${custom.dark4} \
            --text-color ${custom.light1} \
            --text-clear-color ${custom.light1} \
            --text-ver-color ${custom.light1} \
            --text-wrong-color ${custom.light1} \
            --text-caps-lock-color ${custom.orange} \
            --line-uses-ring \
            --font "${custom.font}" \
            --font-size 25 \
            --screenshot \
            --grace "$1" \
            --fade-in "$2" \
            --effect-blur 10x10 \
            --clock \
            --daemonize
    '';
}
