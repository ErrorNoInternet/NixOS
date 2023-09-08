{ pkgs, secrets, ... }:

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

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        kernelParams = [ "console=tty0" ];
        supportedFilesystems = [ "ntfs" ];
    };

    networking = {
        hostName = "NixServer";
        wireless = {
            enable = true;
            networks = secrets.wireless.networks;
        };
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 ];
        };
    };

    i18n.defaultLocale = "en_US.UTF-8";
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
            openssh.authorizedKeys.keys = secrets.ssh.authorizedKeys;
        };
    };

    system.copySystemConfiguration = true;
    system.stateVersion = "23.05";
}
