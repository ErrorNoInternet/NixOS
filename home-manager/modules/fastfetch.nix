{
  home.file = {
    ".config/fastfetch/minimal.conf" = {
      text = ''
--os-key " os"
--os-format "{2} {9} ({12})"
--kernel-key " kernel"
--uptime-key " uptime"
--packages-key "󰆧 packages"
--packages-format "{9}+{10} (nix)"
--disk-key " storage"
--disk-format "{1} / {2} ({3})"
--terminal-key " terminal"
--disk-folders /

--set-keyless colors=\e[37m  \e[36m  \e[35m  \e[34m  \e[33m  \e[32m  \e[31m  \e[30m
--logo nixos_small
--separator "  "
--structure os:kernel:uptime:packages:disk:terminal:colors
'';
    };
    ".config/fastfetch/config.conf" = {
      text = ''
--disk-folders /

--structure title:separator:os:kernel:uptime:packages:shell:display:wm:theme:icons:cursor:terminalfont:terminal:processes:memory:disk:break:colors
'';
    };
  };
}
