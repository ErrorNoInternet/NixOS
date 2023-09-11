# NixOS Server Configuration

## Getting Started
Make sure you already have a functioning NixOS install. You might want to back up your existing files in `/etc/nixos` first.

0. Clone this repository somewhere (`/etc/nixos/nixos-repository` for this guide).

1. Create a directory called `secrets` in `/etc/nixos`. This is where you'll store private information such as WiFi passwords, authorized SSH keys, etc.

    Then, create a file in `secrets/` called `secrets.nix` with the following contents:
    ```nix
    let
        global = {};
    in
    {
        ssh = import ./ssh.nix;
        wireless = import ./wireless.nix;
    }
    ```
    you can replace `ssh` and `wireless` with anything you want, but you'll also have to remove them from `base.nix`.
    You can also add global secrets (e.g. email for alerts) in `global = {}`.

    Now create the respective files in `secrets/` (`ssh.nix` and `wireless.nix`):
    ```nix
    {
        authorizedKeys = [
            "insert ssh public keys here"
        ];
    }
    ```
    and
    ```nix
    {
        networks = {
            "insert WiFi SSID here" = {
                psk = "insert WiFi password here";
            };
        };
    }
    ```

2. Create a file called `host-settings.nix` in `/etc/nixos`. This is where you'll store extra settings for the configuration, such as `location` (for mirrors, timezones, etc) and `type` (`minecraft-server`, `web-server`, etc).

    For example, to use the Minecraft server configuration + mirrors/DNS fixes for China, you could write:
    ```nix
    {
        location = "china";
        type = "minecraft-server";
    }
    ```

    Or just use the base configuration:
    ```nix
    {
        location = "no-location";
        type = "basic-server";
    }
    ```

3. Create a file called `extra.nix` in `/etc/nixos`. This is where you could store extra options for your specific server.

    Empty configuration:
    ```nix
    { pkgs, ... }:

    {
    }
    ```

4. Symlink all the files from this repository to `/etc/nixos`:
    ```console
    cd /etc/nixos/
    sudo ln nixos-repository/server/configuration.nix .
    sudo ln nixos-repository/server/base.nix .
    sudo ln nixos-repository/server/minecraft-server.nix .
    sudo ln -s nixos-repository/server/locations locations
    # and possibly more...
    ```

5. Run `sudo nixos-rebuild switch`, and you should be good to go.

To update this configuration later on, simply run `git pull` (in `nixos-repository`) and `sudo nixos-rebuild switch`.
