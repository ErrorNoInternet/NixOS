{
  programs.fish.shellAbbrs = {
    "ga." = "git add .";
    "ga.c" = "git add . && git commit -m";
    "ga.ca" = "git add . && git commit --amend --no-edit";
    "ga.cae" = "git add . && git commit --amend";
    "gd." = "git diff .";
    "gl." = "git log .";
    "gr." = "git restore .";
    g = "git";
    ga = "git add";
    gam = "git am";
    gama = "git am --abort";
    gamc = "git am --continue";
    game = "git am --allow-empty";
    gams = "git am --skip";
    gap = "git add -p";
    gapl = "git apply";
    gapl3 = "git apply -3";
    gb = "git branch";
    gbd = "git branch -d";
    gbD = "git branch -D";
    gbl = "git blame";
    gbr = "git branch -r";
    gbs = "git bisect";
    gbsb = "git bisect bad";
    gbsg = "git bisect good";
    gbsr = "git bisect reset";
    gbss = "git bisect start";
    gbt = "git branch -t";
    gc = "git commit -m";
    gC = "git commit";
    gca = "git commit --amend --no-edit";
    gcae = "git commit --amend";
    gce = "git commit --allow-empty";
    gcf = "git clean -f .";
    gcfx = "git clean -fX .";
    gch = "git cherry";
    gcl = "git clone";
    gco = "git checkout";
    gcob = "git checkout -b";
    gcoh = "git checkout HEAD^";
    gcp = "git cherry-pick";
    gcpa = "git cherry-pick --abort";
    gcpc = "git cherry-pick --continue";
    gcps = "git cherry-pick --skip";
    gd = "git diff";
    gdc = "git diff --compact-summary";
    gds = "git diff --staged";
    gdsc = "git diff --staged --compact-summary";
    gf = "git fetch origin";
    gl = "git log";
    glf = "git log --follow";
    gls = "git log -S";
    gm = "git merge";
    gma = "git merge --abort";
    gmc = "git merge --continue";
    gmn = "git merge --no-commit";
    gp = "git push";
    gpa = "git push --all";
    gpf = "git push --force-with-lease";
    gpl = "git pull";
    gplu = "git pull --allow-unrelated-histories";
    gpo = "git push origin";
    gpod = "git push origin --delete";
    gps = "git push -u origin";
    gr = "git restore";
    grb = "git rebase -i";
    grba = "git rebase --abort";
    grbc = "git rebase --continue";
    gre = "git reset";
    grh = "git reset HEAD";
    grhh = "git reset HEAD~";
    grm = "git remote";
    grmp = "git remote prune origin";
    grms = "git remote show origin";
    grmsu = "git remote set-url origin";
    grp = "git restore -p";
    grr = "git restore --recurse-submodules";
    grv = "git revert";
    grva = "git revert --abort";
    grvc = "git revert --continue";
    grvn = "git revert --no-commit";
    gs = "git show -m";
    gsh = "git stash";
    gshp = "git stash pop";
    gshs = "git stash show";
    gsm = "git submodule";
    gsmu = "git submodule update";
    gss = "git show -m --stat";
    gst = "git status";
    gsw = "git switch -";
  };
}
