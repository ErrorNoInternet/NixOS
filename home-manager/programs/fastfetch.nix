{pkgs, ...}: {
  home.packages = [pkgs.fastfetch];
  home.file = {
    ".config/fastfetch/minimal.conf".text = ''
      --os-key " system  "
      --os-format "{2} {9} ({12})"
      --kernel-key " kernel  "
      --kernel-format "{1} {2}"
      --uptime-key " uptime  "
      --packages-key "󰆧 packages"
      --packages-format "{9}+{10} (nix)"
      --memory-key "󰍛 memory  "
      --disk-key "󱥎 storage "
      --disk-format "{1} / {2} ({3})"
      --disk-folders /
      --logo-padding-left 1
      --logo-padding-right 3
      --key-width 14
      --set-keyless colors=\e[37m  \e[36m  \e[35m  \e[34m  \e[33m  \e[32m  \e[31m  \e[30m
      --separator " "
      --logo nixos_small

      --structure os:kernel:uptime:packages:memory:disk:colors
    '';
    ".config/fastfetch/nix-on-droid_minimal.conf".text = ''
      --command-key " system  "
      --command-text "echo Android $(/android/system/bin/linker64 /android/system/bin/getprop ro.build.version.release)"
      --kernel-key " kernel  "
      --kernel-format "{1} {2}"
      --uptime-key " uptime  "
      --packages-key "󰆧 packages"
      --packages-format "{9}+{10} (nix)"
      --memory-key "󰍛 memory  "
      --disk-key "󱥎 storage "
      --disk-format "{1} / {2} ({3})"
      --disk-folders /
      --logo-padding-left 1
      --logo-padding-right 3
      --key-width 14
      --set-keyless colors=\e[37m  \e[36m  \e[35m  \e[34m  \e[33m  \e[32m  \e[31m  \e[30m
      --separator " "
      --logo nixos_old_small

      --structure command:kernel:uptime:packages:memory:disk:colors
    '';
    ".config/fastfetch/config.conf".text = ''
      --disk-folders /

      --structure title:separator:os:kernel:uptime:packages:shell:display:wm:theme:icons:cursor:terminalfont:terminal:processes:memory:disk:break:colors
    '';
  };
}
