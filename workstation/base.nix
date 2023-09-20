{ inputs, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes" ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
        extraOptions = ''
            min-free = ${toString (512 * 1024 * 1024)}
            max-free = ${toString (1024 * 1024 * 1024)}
        '';
    };

    i18n.defaultLocale = "en_US.UTF-8";
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
            timeout = 3;
        };
        supportedFilesystems = [ "ntfs" ];
    };
    networking = {
        firewall.enable = false;
        networkmanager.enable = true;
        nameservers = [
            "1.1.1.1#one.one.one.one"
            "1.0.0.1#one.one.one.one"
        ];
    };
    zramSwap = {
        enable = true;
        memoryPercent = 100;
    };
    services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
    };
    services.xserver = {
        enable = true;
        excludePackages = [ pkgs.xterm ];
        displayManager = {
            lightdm.enable = false;
            sddm = {
                enable = true;
                theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
            };
        };
    };

    xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };
    environment.systemPackages = with pkgs; [
        libsForQt5.qt5.qtgraphicaleffects

        vim
        neovim
        wget
        curl
        unzip
        file
        pulseaudio
        xdg-user-dirs
    ];
    programs.zsh = {
        enable = true;
        enableCompletion = true;
    };
    programs.dconf.enable = true;
    programs.light.enable = true;
    programs.gnupg.agent.enable = true;
    services.gnome.gnome-keyring.enable = true;
    services.openssh.enable = true;

    environment.shells = with pkgs; [ zsh ];
    programs.neovim.defaultEditor = true;
    security.pam.services.swaylock = {};
    services.logind.lidSwitch = "ignore";
    fonts = {
        packages = with pkgs; [
            twitter-color-emoji
            (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            source-han-sans
            source-han-serif
        ];
        fontconfig = {
            defaultFonts = {
                serif = [ "JetBrainsMono Nerd Font" ];
                sansSerif = [ "JetBrainsMono Nerd Font" ];
                monospace = [ "JetBrainsMono Nerd Font" ];
                emoji = [ "Twitter Color Emoji" ];
            };
        };
    };

    environment.etc."xdg/user-dirs.defaults".text=''
        DESKTOP=
        TEMPLATES=
        PUBLICSHARE=
        DOCUMENTS=
        MUSIC=
        PICTURES=
        VIDEOS=
    '';
    users.users.ryan = {
        initialPassword = "gigachad";
        isNormalUser = true;
        extraGroups = [ "wheel" "video" ];
        shell = pkgs.zsh;
    };

    system.stateVersion = "23.05";
}
