{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })

      noto-fonts

      noto-fonts-cjk-sans
      source-han-sans

      noto-fonts-cjk-serif
      source-han-serif

      noto-fonts-emoji
      twitter-color-emoji
    ];

    fontconfig.defaultFonts = {
      serif = [
        "JetBrainsMono Nerd Font"
        "Noto Serif CJK SC"
      ];
      sansSerif = [
        "JetBrainsMono Nerd Font"
        "Noto Sans CJK SC"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
      ];
      emoji = [
        "Twitter Color Emoji"
      ];
    };
  };
}
