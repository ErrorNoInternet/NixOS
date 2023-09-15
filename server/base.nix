{ config, pkgs, ... }:

{
    age.secrets.wireless-networks.file = ../../secrets/wireless-networks.age;

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
        };
        kernelParams = [ "console=tty0" ];
        supportedFilesystems = [ "ntfs" ];
    };
    networking = {
        wireless = {
            enable = true;
            environmentFile = config.age.secrets.wireless-networks;
            networks = {
                "@ssid1@".psk = "@psk1@";
                "@ssid2@".psk = "@psk2@";
            };
        };
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 ];
        };
    };
    zramSwap = {
        enable = true;
        memoryPercent = 50;
    };
    environment.systemPackages = with pkgs; [
        neovim
        wget
        curl
        zip
        unzip
        file
        tmux
        git

        btop
    ];

    services.openssh.enable = true;
    users.users = {
        root.password = "snowflake";
        snowflake = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            initialPassword = "snowflake";
            openssh.authorizedKeys.keys = config.age.secrets.systems;
        };
    };

    system.stateVersion = "23.05";
}
