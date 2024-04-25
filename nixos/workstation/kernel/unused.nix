{lib, ...}: {
  boot.kernelPatches = [
    {
      name = "Remove unused features";
      patch = null;
      extraStructuredConfig = with lib.kernel; {
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
  ];
}
