{
  config,
  lib,
  ...
}: let
  cfg = config.workstation.kernel.patches;
  inherit (lib) mkForce optional attrsets;
in
  with lib.kernel; {
    boot.kernelPatches = optional cfg.removeUnused {
      name = "Remove extra unused features";
      patch = null;
      extraStructuredConfig = attrsets.mapAttrs (_: mkForce) {
        ATALK = no;
        BATMAN_ADV = no;
        CAIF = no;
        COMEDI = no;
        DVB_CORE = no;
        IIO = no;
        INPUT_TOUCHSCREEN = no;
        NFC = no;
        SURFACE_AGGREGATOR = no;
        USB_GSPCA = no;
        XEN = no;

        AFFS_FS = no;
        AFS_FS = no;
        BEFS_FS = no;
        CODA_FS = no;
        JFS_FS = no;
        OCFS2_FS = no;
        OMFS_FS = no;
        ORANGEFS_FS = no;
        SYSV_FS = no;

        INFINIBAND = no;
        INFINIBAND_IPOIB = unset;
        INFINIBAND_IPOIB_CM = unset;
        NET_DSA = no;
        NET_VENDOR_CISCO = no;
        NET_VENDOR_HUAWEI = no;
        NET_VENDOR_MARVELL = no;
        NET_VENDOR_MELLANOX = no;
        NET_VENDOR_RENESAS = no;
        RT2800USB_RT53XX = unset;
        RT2800USB_RT55XX = unset;
        WLAN_VENDOR_MEDIATEK = no;
        WLAN_VENDOR_RALINK = no;
        X25 = no;

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
        DELL_WMI = unset;
        DELL_WMI_AIO = no;
        DELL_WMI_DESCRIPTOR = unset;
        DELL_WMI_LED = no;
        DELL_WMI_SYSMAN = no;
        HUAWEI_WMI = no;

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

        SND_SOC = no;
        SND_SOC_INTEL_SOUNDWIRE_SOF_MACH = unset;
        SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES = unset;
        SND_SOC_SOF_ACPI = unset;
        SND_SOC_SOF_APOLLOLAKE = unset;
        SND_SOC_SOF_CANNONLAKE = unset;
        SND_SOC_SOF_COFFEELAKE = unset;
        SND_SOC_SOF_COMETLAKE = unset;
        SND_SOC_SOF_ELKHARTLAKE = unset;
        SND_SOC_SOF_GEMINILAKE = unset;
        SND_SOC_SOF_HDA_AUDIO_CODEC = unset;
        SND_SOC_SOF_HDA_LINK = unset;
        SND_SOC_SOF_ICELAKE = unset;
        SND_SOC_SOF_INTEL_TOPLEVEL = unset;
        SND_SOC_SOF_JASPERLAKE = unset;
        SND_SOC_SOF_MERRIFIELD = unset;
        SND_SOC_SOF_PCI = unset;
        SND_SOC_SOF_TIGERLAKE = unset;
        SND_SOC_SOF_TOPLEVEL = unset;

        DRM_AMD_ACP = unset;
        DRM_AMD_DC_FP = unset;
        DRM_AMD_DC_SI = unset;
        DRM_AMD_SECURE_DISPLAY = unset;
        DRM_AMDGPU = no;
        DRM_AMDGPU_CIK = unset;
        DRM_AMDGPU_SI = unset;
        DRM_AMDGPU_USERPTR = unset;
        DRM_ETNAVIV = no;
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
