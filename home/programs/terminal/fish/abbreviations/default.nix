{config, ...}: {
  imports = [
    ./git.nix
    ./mullvad.nix
    ./nix.nix
    ./zfs.nix
  ];

  programs.fish.shellAbbrs = {
    "...." = "../..";
    "......" = "../../..";
    "........" = "../../../..";
    ".........." = "../../../../..";
    "............" = "../../../../../..";

    c = "cd ${
      if config.flags.nixOnDroid
      then "~/.config/nixpkgs"
      else "/etc/nixos"
    }/configuration.nix/";
    cl = "curl -L";
    clo = "curl -LO";
    e = "echo";
    nv = "nvim";
    p = "printf";
    s = "sudo";
    sc = "systemctl";
    scu = "systemctl --user";
    wr = "wf-recorder -b 0 -c h264_nvenc -p b=5M -f recording_(date \"+%Y-%m-%-d_%H:%M:%S\").mp4";
  };
}
