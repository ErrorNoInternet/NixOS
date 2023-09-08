# NixOS Server Configuration

## Getting Started
First make a directory called `secrets`. This is where you'll store private information such as WiFi passwords, authorized SSH keys, etc.

Create a file in `secrets/` called `secrets.nix` with the following contents:
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
