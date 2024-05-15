{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOverride optional optionals strings versionAtLeast;
  kernelVersion = config.workstation.kernel.version;
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
          HZ = freeform "1000";
          HZ_1000 = yes;

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
        };
      }

      {
        name = "fq_codel packet scheduling";
        patch = null;
        extraStructuredConfig = with lib.kernel; {
          NET_SCH_DEFAULT = yes;
          DEFAULT_FQ_CODEL = yes;
          DEFAULT_NET_SCH = freeform "fq_codel";
        };
      }
    ]
    ++ optionals (versionAtLeast kernelVersion "6.6") [
      {
        name = "BORE CPU scheduler";
        patch =
          if kernelVersion == "6.6"
          then ./files/linux6.6.y-bore5.1.0.patch
          else ./files/linux6.8.y-bore5.1.0.patch;
      }
    ]
    ++ optionals (versionAtLeast kernelVersion "6.8") [
      {
        name = "zstd updates";
        patch = ./files/zstd-updates.patch;
      }

      {
        name = "aes-xts updates";
        patch = ./files/aes-xts-updates.patch;
      }
    ];
}
