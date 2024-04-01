{config, ...}: {
  imports = [
    ./git.nix
    ./mullvad.nix
    ./nix.nix
    ./zfs.nix
  ];

  programs.fish.shellAbbrs =
    {
      "...." = "../..";
      "......" = "../../..";
      "........" = "../../../..";
      ".........." = "../../../../..";
      "............" = "../../../../../..";

      c = "cd ${
        if config.flags.isNixOnDroid
        then "~/.config/nixpkgs"
        else "/etc/nixos"
      }/configuration.nix";

      "-" = "cd -";
      cl = "curl -L";
      clo = "curl -LO";
      d = "cd ~/data";
      dm = "dmesg";
      dmt = "dmesg -T";
      dmtw = "dmesg -Tw";
      e = "echo";
      ex = "exec";
      nv = "nvim";
      p = "ping";
      pf = "printf";
      s = "sudo";
      sc = "systemctl";
      scu = "systemctl --user";
      sl = "sleep";

      hy = "hyprctl";
    }
    // (let
      wf-recorder = "wf-recorder -b 0 -c h264_nvenc -p b=5M -f recording_(date \"+%Y-%m-%d_%H:%M:%S\").mp4";
    in {
      wr = wf-recorder;
      wra = "${wf-recorder} -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor";
      wrs = "${wf-recorder} -g (slurp)";
      wrsa = "${wf-recorder} -a=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -g (slurp)";
    });
}
