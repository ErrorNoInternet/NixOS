{
  imports = [
    ./git.nix
    ./nix.nix
  ];

  programs.fish.shellAbbrs = {
    s = "sudo";
    nv = "nvim";

    wr = "wf-recorder -b 0 -c h264_nvenc -p b=5M";
  };
}
