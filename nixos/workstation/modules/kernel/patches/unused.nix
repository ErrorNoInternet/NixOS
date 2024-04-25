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
            BATMAN_ADV = no;
            CAIF = no;
            IIO = no;
            INFINIBAND = no;
            INFINIBAND_IPOIB = unset;
            INFINIBAND_IPOIB_CM = unset;
            NET_VENDOR_RENESAS = no;

            SND_ATMEL_SOC = no;
            SND_DESIGNWARE_I2S = no;
            SND_I2S_HI6210_I2S = no;
            SND_SOC_ADI = no;
            SND_SOC_CHV3_I2S = no;
            SND_SOC_FSL_ASRC = no;
            SND_SOC_FSL_AUDMIX = no;
            SND_SOC_FSL_ESAI = no;
            SND_SOC_FSL_MICFIL = no;
            SND_SOC_FSL_SAI = no;
            SND_SOC_FSL_SPDIF = no;
            SND_SOC_FSL_SSI = no;
            SND_SOC_FSL_XCVR = no;
            SND_SOC_IMG = no;
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
          COMEDI = no;
          NFC = no;
          DRM_XE = no;
          SURFACE_AGGREGATOR = no;

          DELL_RBTN = no;
          DELL_RBU = no;
          DELL_SMBIOS = no;
          DELL_WMI = unset;
          DELL_WMI_AIO = no;
          DELL_WMI_DESCRIPTOR = unset;
          DELL_WMI_LED = no;
          DELL_WMI_SYSMAN = no;

          ALIENWARE_WMI = no;
          ALIM1535_WDT = no;
          ALIM7101_WDT = no;
          ALTERA_MBOX = no;
          ALTERA_MSGDMA = no;
          ALTERA_TSE = no;
          ALX = no;

          CHROME_PLATFORMS = no;
          CHROMEOS_LAPTOP = unset;
          CHROMEOS_PSTORE = unset;
          CHROMEOS_TBMC = unset;
          CROS_EC = unset;
          CROS_EC_I2C = unset;
          CROS_EC_ISHTP = unset;
          CROS_EC_LPC = unset;
          CROS_EC_SPI = unset;
          CROS_KBD_LED_BACKLIGHT = unset;

          DRM_AMD_ACP = unset;
          DRM_AMD_DC_FP = unset;
          DRM_AMD_DC_SI = unset;
          DRM_AMD_SECURE_DISPLAY = unset;
          DRM_AMDGPU = no;
          DRM_AMDGPU_CIK = unset;
          DRM_AMDGPU_SI = unset;
          DRM_AMDGPU_USERPTR = unset;
          DRM_GMA500 = no;
          DRM_RADEON = no;
          DRM_VMWGFX = no;
          FB_RADEON = no;
          FB_RADEON_BACKLIGHT = unset;
          FB_RADEON_I2C = unset;
          HSA_AMD = unset;
        };
      };
  }
