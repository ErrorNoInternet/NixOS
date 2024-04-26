{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkOverride optional strings;
  inherit (pkgs) fetchurl;
in {
  boot.kernelPatches = [
    {
      name = "BORE CPU scheduler";
      patch = let
        baseUrl = "https://raw.githubusercontent.com/firelzrd/bore-scheduler/main/patches/stable";
        kernelVersion = lib.versions.majorMinor config.boot.kernelPackages.kernel.version;
      in
        fetchurl (
          if kernelVersion == "6.6"
          then {
            url = baseUrl + "/linux-6.6-bore/0001-linux6.6.y-bore5.1.0.patch";
            hash = "sha256-iLydPGZZSkEQhSj6Ah0Xq0zf7YUPwcpyKt8t0BeHYz8=";
          }
          else {
            url = baseUrl + "/linux-6.8-bore/0001-linux6.8.y-bore5.1.0.patch";
            hash = "sha256-WyD1NuM+1m12O3ppjhZ+6YrJFQJn9Zcyz4QV2YgwNGk=";
          }
        );
    }

    {
      name = "BTRFS allocator hints";
      patch = ./files/btrfs-allocator-hints.patch;
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
      name = "Rust support";
      patch = null;
      features.rust = true;
    }

    {
      name = "Native CPU optimizations";
      patch = null;
      extraMakeFlags = let
        inherit (config.host) architecture;
      in
        ["-march=${architecture}"]
        ++ optional (!strings.hasPrefix "x86-64-" architecture) "-mtune=${architecture}";
    }
  ];
}
