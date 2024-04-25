{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.kernel.patches;
  inherit (lib) mkForce optional attrsets;
in
  with lib.kernel; {
    boot.kernelPatches =
      [
        {
          name = "Remove unused features";
          patch = null;
          extraStructuredConfig = attrsets.mapAttrs (_: mkForce) {
            CONFIG_BATMAN_ADV = no;
            CONFIG_CAIF = no;
            CONFIG_NET_VENDOR_RENESAS = no;
            CONFIG_SUNRPC = no;

            SND_ATMEL_SOC = no;
            SND_DESIGNWARE_I2S = no;
            SND_I2S_HI6210_I2S = no;
            SND_SOC_ADI = no;
            SND_SOC_APPLE_MCA = no;
            SND_SOC_CHV3_I2S = no;
            SND_SOC_FSL_ASRC = no;
            SND_SOC_FSL_AUDMIX = no;
            SND_SOC_FSL_EASRC = no;
            SND_SOC_FSL_ESAI = no;
            SND_SOC_FSL_MICFIL = no;
            SND_SOC_FSL_MQS = no;
            SND_SOC_FSL_RPMSG = no;
            SND_SOC_FSL_SAI = no;
            SND_SOC_FSL_SPDIF = no;
            SND_SOC_FSL_SSI = no;
            SND_SOC_FSL_UTILS = no;
            SND_SOC_FSL_XCVR = no;
            SND_SOC_IMG = no;
            SND_SOC_STI = no;
            SND_SOC_XILINX_AUDIO_FORMATTER = no;
            SND_SOC_XILINX_I2S = no;
            SND_SOC_XILINX_SPDIF = no;
            SND_XEN_FRONTEND = no;
          };
        }
      ]
      ++ optional cfg.removeUnusedExtra
      {
        name = "Remove extra unused features";
        patch = null;
        extraStructuredConfig = attrsets.mapAttrs (_: mkForce) {
          CONFIG_CHROME_PLATFORMS = no;
          CONFIG_COMEDI = no;
          CONFIG_IIO = no;
          CONFIG_INFINIBAND = no;
          CONFIG_NFC = no;
          CONFIG_SURFACE_AGGREGATOR = no;

          ALIENWARE_WMI = no;
          ALIM1535_WDT = no;
          ALIM7101_WDT = no;
          ALTERA_MBOX = no;
          ALTERA_MSGDMA = no;
          ALTERA_TSE = no;
          ALX = no;

          DELL_RBTN = no;
          DELL_RBU = no;
          DELL_SMBIOS = no;
          DELL_WMI = no;
          DELL_WMI_AIO = no;
          DELL_WMI_DESCRIPTOR = no;
          DELL_WMI_LED = no;
          DELL_WMI_SYSMAN = no;

          CONFIG_DRM_AMDGPU = no;
          CONFIG_DRM_AMDGPU_CIK = no;
          CONFIG_DRM_GMA500 = no;
          CONFIG_DRM_RADEON = no;
          CONFIG_DRM_VMWGFX = no;
          CONFIG_DRM_XE = no;
          CONFIG_FB_RADEON = no;
          CONFIG_FB_RADEON_BACKLIGHT = no;
          CONFIG_FB_RADEON_I2C = no;
        };
      };
  }
