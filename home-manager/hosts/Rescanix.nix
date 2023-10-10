{ config, inputs, pkgs, ... }:

let
    custom = {
        font = "JetBrainsMono Nerd Font";
        dark1 = "2E3440";
        dark2 = "3B4252";
        dark3 = "434C5E";
        dark3-rgb = "67, 76, 94";
        dark4 = "4C566A";
        light1 = "D8DEE9";
        light2 = "E5E9F0";
        light3 = "ECEFF4";
        nord1 = "8FBCBB";
        nord2 = "88C0D0";
        nord3 = "81A1C1";
        nord4 = "5E81AC";
        red = "BF616A";
        orange = "D08770";
        yellow = "EBCB8B";
        green = "A3BE8C";
        pink = "B48EAD";
        opacity = ".7";
        subtleOpacity = ".9";
        pointerCursor = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 16;
        };
        gtkTheme = {
            name = "Colloid-Dark-Nord";
            package = pkgs.colloid-gtk-theme.override { tweaks = [ "nord" ]; };
        };
        gtkIconTheme = {
            name = "Colloid-nord-dark";
            package = pkgs.colloid-icon-theme.override { schemeVariants = [ "nord" ]; };
        };
    };
in
{
    imports = [
        (import ../modules/cava.nix { inherit custom; })
        (import ../modules/dunst.nix { inherit custom pkgs; })
        (import ../modules/fcitx.nix { inherit pkgs; })
        (import ../modules/gtk.nix { inherit custom; })
        (import ../modules/hyprland-autoname-workspaces.nix { inherit custom; })
        (import ../modules/hyprland.nix { inherit custom inputs pkgs; })
        (import ../modules/kitty.nix { inherit custom; })
        (import ../modules/neovim.nix { inherit pkgs; })
        (import ../modules/rofi.nix { inherit config custom pkgs; })
        (import ../modules/tmux.nix { inherit pkgs; })
        (import ../modules/waybar.nix { inherit custom pkgs; })
        ../modules/bat.nix
        ../modules/btop.nix
        ../modules/desktop-entries.nix
        ../modules/fastfetch.nix
        ../modules/git.nix
        ../modules/kdeconnect.nix
        ../modules/mpv.nix
        ../modules/obs-studio.nix
        ../modules/yazi.nix
        ../modules/zoxide.nix
        ../modules/zsh.nix
    ];

    home.username = "ryan";
    home.homeDirectory = "/home/ryan";

    home.packages = with pkgs; [
        (hashcat.override { cudaSupport = true; })
        (import ../../workstation/derivations/collect-hwinfo.nix { inherit pkgs; })
        (import ../../workstation/derivations/passgen.nix { inherit pkgs; })
        (import ../../workstation/derivations/tbw.nix { inherit pkgs; })
        (import ../derivations/brightness.nix { inherit pkgs; })
        (import ../derivations/pavolume.nix { inherit pkgs; })
        (import ../derivations/swaylock.nix { inherit custom pkgs; })
        _7zz
        bandwhich
        blender
        brave
        cava
        cliphist
        cmatrix
        compsize
        cpu-x
        drm_info
        duf
        eza
        fastfetch
        ffmpeg_6-full
        firefox
        gcc
        geekbench
        gimp
        hyprland-autoname-workspaces
        hyprpicker
        inputs.hsize.packages.${pkgs.system}.hsize
        inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
        inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
        inputs.nix-gaming.packages.${pkgs.system}.wine-ge
        intel-gpu-tools
        jq
        kdiskmark
        lm_sensors
        lshw
        mangohud
        mesa-demos
        nmap
        nvtop
        pavucontrol
        powertop
        prismlauncher
        pv
        python3
        radeontop
        ripdrag
        rustup
        smartmontools
        sshfs
        superTuxKart
        swayidle
        swaylock-effects
        swww
        timg
        unigine-heaven
        vulkan-tools
        wl-clipboard
    ];

    home.sessionVariables = {
        TERMINAL = "kitty";
        BROWSER = "firefox";
    };

    home.pointerCursor = {
        name = custom.pointerCursor.name;
        package = custom.pointerCursor.package;
        size = custom.pointerCursor.size;
        x11.enable = true;
        gtk.enable = true;
    };
}
