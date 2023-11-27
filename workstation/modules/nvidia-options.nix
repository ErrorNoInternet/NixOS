{
  specialisation = {
    no-nvidia.configuration = {
      hardware.nvidia.modesetting.enable = false;
      hardware.nvidia.prime.offload.enable = false;
    };

    no-nvidia-prime.configuration = {
      hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
      services.xserver.videoDrivers = ["nvidia"];
      hardware.nvidia = {
        modesetting.enable = true;
        prime.offload.enable = false;
      };
    };
  };
}
