{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOverride optional optionals strings versions versionAtLeast;
  inherit (pkgs) fetchpatch;

  kernelVersion = versions.majorMinor config.workstation.kernel.packages.kernel.version;
in {
  boot.kernelPatches =
    [
      {
        name = "Native CPU optimizations";
        patch = null;
        extraMakeFlags = let
          inherit (config.host) architecture;
        in
          ["-march=${architecture}"]
          ++ optional (!strings.hasPrefix "x86-64-" architecture) "-mtune=${architecture}";
      }

      {
        name = "Lower latency";
        patch = null;
        extraStructuredConfig = with lib.kernel; {
          NET_SCH_DEFAULT = yes;
          DEFAULT_FQ_CODEL = yes;
          DEFAULT_NET_SCH = freeform "fq_codel";

          PREEMPT = mkOverride 60 yes;
          PREEMPT_BUILD = mkOverride 60 yes;
          PREEMPT_COUNT = mkOverride 60 yes;
          PREEMPT_VOLUNTARY = mkOverride 60 no;
          PREEMPTION = mkOverride 60 yes;

          TREE_RCU = yes;
          PREEMPT_RCU = yes;
          RCU_EXPERT = yes;
          TREE_SRCU = yes;
          TASKS_RCU_GENERIC = yes;
          TASKS_RCU = yes;
          TASKS_RUDE_RCU = yes;
          TASKS_TRACE_RCU = yes;
          RCU_STALL_COMMON = yes;
          RCU_NEED_SEGCBLIST = yes;
          RCU_FANOUT = freeform "64";
          RCU_FANOUT_LEAF = freeform "16";
          RCU_BOOST = yes;
          RCU_BOOST_DELAY = freeform "500";
          RCU_NOCB_CPU = yes;
          RCU_LAZY = yes;

          FUTEX = yes;
          FUTEX_PI = yes;

          HZ = freeform "1000";
          HZ_1000 = yes;
        };
      }

      {
        name = "BORE CPU scheduler";
        patch = let
          baseUrl = "https://raw.githubusercontent.com/firelzrd/bore-scheduler/main/patches/stable";
        in
          fetchpatch (
            if kernelVersion == "6.6"
            then let
              name = "0001-linux6.6.y-bore5.1.0.patch";
            in {
              inherit name;
              url = baseUrl + "/linux-6.6-bore/${name}";
              hash = "sha256-xIZ6vnMW6oi155JS8ZtBVXfcXHduBDGGHMuhDMoZwH0=";
            }
            else let
              name = "0001-linux6.8.y-bore5.1.0.patch";
            in {
              inherit name;
              url = baseUrl + "/linux-6.8-bore/${name}";
              hash = "sha256-CGw3gWEiNUDgn0J3DqlIr5/C2RkM8zVGYfmIaIO/Cao=";
            }
          );
      }
    ]
    ++ optionals (versionAtLeast kernelVersion "6.8") [
      {
        name = "zstd updates";
        patch = fetchpatch {
          name = "zstd.patch";
          url = "https://raw.githubusercontent.com/CachyOS/kernel-patches/master/6.8/0009-zstd.patch";
          hash = "sha256-mW9OJmGMRqDZLnrg1nLtLOGibzx2cV4Tt/c2nv4jouM=";
        };
      }

      {
        name = "aes-xts updates";
        patch = fetchpatch {
          name = "aes-xts.patch";
          url = "https://raw.githubusercontent.com/CachyOS/kernel-patches/master/6.8/0001-aes-xts.patch";
          hash = "sha256-L3N81Vvq4keHpIB/LmZK6sGUipfqzTf9H9yOPRn2PVg=";
        };
      }
    ];
}
