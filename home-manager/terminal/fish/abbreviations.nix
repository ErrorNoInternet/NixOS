{
  programs.fish.shellAbbrs = {
    s = "sudo";
    nv = "nvim";

    nd = "nix develop -c fish";
    nr = "nix run";
    ns = "nix shell";

    g = "git";
    ga = "git add";
    gap = "git add -p";
    gb = "git branch";
    gbl = "git blame";
    gc = "git commit -m";
    gca = "git commit --amend";
    gcf = "git clean -f";
    gcl = "git clone";
    gco = "git checkout";
    gd = "git diff";
    gdc = "git diff --compact-summary";
    gds = "git diff --staged";
    gl = "git log";
    gp = "git push";
    gpl = "git pull";
    gr = "git restore";
    gre = "git reset";
    gs = "git show";
    gst = "git status";
  };
}
