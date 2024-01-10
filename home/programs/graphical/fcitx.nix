{
  config,
  lib,
  pkgs,
  ...
}: let
  theme = pkgs.fetchFromGitHub {
    owner = "tonyfettes";
    repo = "fcitx5-nord";
    rev = "bdaa8fb723b8d0b22f237c9a60195c5f9c9d74d1";
    sha256 = "sha256-qVo/0ivZ5gfUP17G29CAW0MrRFUO0KN1ADl1I/rvchE=";
  };
in {
  config = lib.mkIf config.profiles.desktop.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-chinese-addons
      ];
    };

    home.file.".local/share/fcitx5/themes/Nord-Dark" = {
      source = "${theme}/Nord-Dark";
      recursive = true;
    };

    home.file = {
      ".config/fcitx5/conf/classicui.conf".text = ''
        # Vertical Candidate List
        Vertical Candidate List=False
        # Use Per Screen DPI
        PerScreenDPI=True
        # Use mouse wheel to go to prev or next page
        WheelForPaging=True
        # Font
        Font="Sans 10"
        # Menu Font
        MenuFont="Sans 10"
        # Tray Font
        TrayFont="Sans Bold 10"
        # Tray Label Outline Color
        TrayOutlineColor=#000000
        # Tray Label Text Color
        TrayTextColor=#ffffff
        # Prefer Text Icon
        PreferTextIcon=True
        # Show Layout Name In Icon
        ShowLayoutNameInIcon=True
        # Use input method language to display text
        UseInputMethodLangaugeToDisplayText=True
        # Theme
        Theme=Nord-Dark
        # Force font DPI on Wayland
        ForceWaylandDPI=0
      '';

      ".config/fcitx5/config".text = ''
        [Hotkey]
        # Enumerate when press trigger key repeatedly
        EnumerateWithTriggerKeys=True
        # Skip first input method while enumerating
        EnumerateSkipFirst=False

        [Hotkey/TriggerKeys]
        0=Control+space
        1=Zenkaku_Hankaku
        2=Hangul

        [Hotkey/AltTriggerKeys]
        0=Shift_L

        [Hotkey/EnumerateForwardKeys]
        0=

        [Hotkey/EnumerateBackwardKeys]
        0=

        [Hotkey/EnumerateGroupForwardKeys]
        0=Super+space

        [Hotkey/EnumerateGroupBackwardKeys]
        0=Shift+Super+space

        [Hotkey/ActivateKeys]
        0=Hangul_Hanja

        [Hotkey/DeactivateKeys]
        0=Hangul_Romaja

        [Hotkey/PrevPage]
        0=Up

        [Hotkey/NextPage]
        0=Down

        [Hotkey/PrevCandidate]
        0=Shift+Tab

        [Hotkey/NextCandidate]
        0=Tab

        [Hotkey/TogglePreedit]
        0=Control+Alt+P

        [Behavior]
        # Active By Default
        ActiveByDefault=False
        # Share Input State
        ShareInputState=No
        # Show preedit in application
        PreeditEnabledByDefault=True
        # Show Input Method Information when switch input method
        ShowInputMethodInformation=True
        # Show Input Method Information when changing focus
        showInputMethodInformationWhenFocusIn=False
        # Show compact input method information
        CompactInputMethodInformation=True
        # Show first input method information
        ShowFirstInputMethodInformation=True
        # Default page size
        DefaultPageSize=7
        # Override Xkb Option
        OverrideXkbOption=False
        # Custom Xkb Option
        CustomXkbOption=
        # Force Enabled Addons
        EnabledAddons=
        # Force Disabled Addons
        DisabledAddons=
        # Preload input method to be used by default
        PreloadInputMethod=True
      '';

      ".config/fcitx5/profile" = {
        force = true;
        text = ''
          [Groups/0]
          # Group Name
          Name=Default
          # Layout
          Default Layout=us
          # Default Input Method
          DefaultIM=pinyin

          [Groups/0/Items/0]
          # Name
          Name=keyboard-us
          # Layout
          Layout=

          [Groups/0/Items/1]
          # Name
          Name=pinyin
          # Layout
          Layout=

          [GroupOrder]
          0=Default
        '';
      };

      ".config/fcitx5/conf/pinyin.conf" = {
        force = true;
        text = ''
          # Shuangpin Profile
          ShuangpinProfile=Ziranma
          # Show current shuangpin mode
          ShowShuangpinMode=True
          # Page size
          PageSize=7
          # Enable Spell
          SpellEnabled=True
          # Enable Emoji
          EmojiEnabled=True
          # Enable Chaizi
          ChaiziEnabled=True
          # Enable Characters in Unicode CJK Extension B
          ExtBEnabled=True
          # Enable Cloud Pinyin
          CloudPinyinEnabled=True
          # Cloud Pinyin Index
          CloudPinyinIndex=2
          # Show preedit within application
          PreeditInApplication=True
          # Fix embedded preedit cursor at the beginning of the preedit
          PreeditCursorPositionAtBeginning=True
          # Show complete pinyin in preedit
          PinyinInPreedit=False
          # Enable Prediction
          Prediction=False
          # Prediction Size
          PredictionSize=10
          # Action when switching input method
          SwitchInputMethodBehavior="Commit current preedit"
          # Select 2nd Candidate
          SecondCandidate=
          # Select 3rd Candidate
          ThirdCandidate=
          # Use Keypad as Selection key
          UseKeypadAsSelection=False
          # Use BackSpace to cancel the selection
          BackSpaceToUnselect=True
          # Number of Sentences
          Number of sentence=2
          # Prompt long word length when input length over (0 for disable)
          LongWordLengthLimit=4
          # Key to trigger quickphrase
          QuickPhraseKey=semicolon
          # Use V to trigger quickphrase
          VAsQuickphrase=True
          # FirstRun
          FirstRun=False

          [ForgetWord]
          0=Control+7

          [PrevPage]
          0=Up
          1=Page_Up

          [NextPage]
          0=Down
          1=Next

          [PrevCandidate]
          0=Left

          [NextCandidate]
          0=Right

          [ChooseCharFromPhrase]
          0=bracketleft
          1=bracketright

          [FilterByStroke]
          0=grave

          [QuickPhrase trigger]
          0=www.
          1=ftp.
          2=http:
          3=mail.
          4=bbs.
          5=forum.
          6=https:
          7=ftp:
          8=telnet:
          9=mailto:

          [Fuzzy]
          # ue -> ve
          VE_UE=True
          # Common Typo
          NG_GN=True
          # Inner Segment (xian -> xi'an)
          Inner=True
          # Inner Segment for Short Pinyin (qie -> qi'e)
          InnerShort=True
          # Match partial finals (e -> en, eng, ei)
          PartialFinal=True
          # Match partial shuangpin if input length is longer than 4
          PartialSp=False
          # u <-> v
          V_U=True
          # an <-> ang
          AN_ANG=False
          # en <-> eng
          EN_ENG=True
          # ian <-> iang
          IAN_IANG=False
          # in <-> ing
          IN_ING=True
          # u <-> ou
          U_OU=False
          # uan <-> uang
          UAN_UANG=False
          # c <-> ch
          C_CH=False
          # f <-> h
          F_H=False
          # l <-> n
          L_N=False
          # s <-> sh
          S_SH=False
          # z <-> zh
          Z_ZH=False
        '';
      };
    };
  };
}
