{
  config,
  lib,
  ...
}: let
  cfg = config.customPrograms.discord;
  inherit (lib) mkEnableOption mkOption mkIf types;
in {
  options.customPrograms.discord = {
    enable = mkEnableOption "";

    package = mkOption {
      type = types.package;
      default = config.pkgsSelf.vesktop;
    };

    finalPackage = mkOption {
      type = types.package;
      readOnly = true;
      default = cfg.package.overrideAttrs {
        postFixup = ''
          wrapProgram $out/bin/${lib.getName cfg.package} \
            --add-flags "--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile = {
      "vesktop/settings/settings.json".text = builtins.toJSON {
        autoUpdate = false;
        autoUpdateNotification = true;
        disableMinSize = false;
        enableReactDevtools = false;
        enabledThemes = [];
        frameless = false;
        macosTranslucency = false;
        notifications = {
          logLimit = 50;
          position = "bottom-right";
          timeout = 5000;
          useNative = "not-focused";
        };
        notifyAboutUpdates = true;

        plugins = {
          AlwaysTrust.enabled = true;
          BadgeAPI.enabled = true;
          BetterFolders = {
            closeAllFolders = false;
            closeAllHomeButton = false;
            closeOthers = false;
            enabled = true;
            forceOpen = false;
            keepIcons = false;
            showFolderIcon = 1;
            sidebar = true;
            sidebarAnim = true;
          };
          BetterNotesBox = {
            enabled = true;
            hide = false;
            noSpellCheck = true;
          };
          BiggerStreamPreview.enabled = true;
          CallTimer = {
            enabled = true;
            format = "human";
          };
          CommandsAPI.enabled = true;
          ContextMenuAPI.enabled = true;
          CrashHandler = {
            attemptToNavigateToHome = false;
            attemptToPreventCrashes = true;
            enabled = true;
          };
          EmoteCloner.enabled = true;
          Experiments = {
            enableIsStaff = false;
            enabled = true;
            forceStagingBanner = false;
          };
          FakeNitro = {
            emojiSize = 48;
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            enabled = true;
            stickerSize = 160;
            transformCompoundSentence = false;
            transformEmojis = true;
            transformStickers = true;
          };
          FavoriteEmojiFirst.enabled = true;
          ForceOwnerCrown.enabled = true;
          GifPaste.enabled = true;
          ImageZoom = {
            enabled = true;
            invertScroll = true;
            nearestNeighbour = false;
            preventCarouselFromClosingOnClick = true;
            saveZoomValues = true;
            size = 792;
            square = false;
            zoom = 2;
            zoomSpeed = 0.5;
          };
          KeepCurrentChannel.enabled = true;
          LoadingQuotes = {
            enabled = true;
            replaceEvents = true;
          };
          MemberCount = {
            enabled = true;
            memberList = true;
            toolTip = true;
          };
          MemberListDecoratorsAPI.enabled = true;
          MessageAccessoriesAPI.enabled = true;
          MessageDecorationsAPI.enabled = true;
          MessageEventsAPI.enabled = true;
          MessageLinkEmbeds = {
            automodEmbeds = "never";
            enabled = true;
            idList = "";
            listMode = "blacklist";
          };
          MessageLogger = {
            deleteStyle = "overlay";
            enabled = true;
            ignoreBots = false;
            ignoreChannels = "";
            ignoreGuilds = "";
            ignoreSelf = false;
            ignoreUsers = "";
            logEdits = true;
            logDeletes = true;
          };
          MessagePopoverAPI.enabled = true;
          MoreUserTags = {
            enabled = true;
            tagSettings = {
              ADMINISTRATOR = {
                showInChat = true;
                showInNotChat = true;
                text = "Admin";
              };
              MODERATOR = {
                showInChat = true;
                showInNotChat = true;
                text = "Mod";
              };
              MODERATOR_STAFF = {
                showInChat = false;
                showInNotChat = false;
                text = "Staff";
              };
              OWNER = {
                showInChat = true;
                showInNotChat = true;
                text = "Owner";
              };
              VOICE_MODERATOR = {
                showInChat = false;
                showInNotChat = true;
                text = "VC Mod";
              };
              WEBHOOK = {
                showInChat = true;
                showInNotChat = true;
                text = "Webhook";
              };
            };
          };
          MutualGroupDMs.enabled = true;
          NoF1.enabled = true;
          NoReplyMention = {
            enabled = true;
            inverseShiftReply = false;
            shouldPingListed = false;
            userList = "372809091208445953 419880181101232129";
          };
          NoTrack.enabled = true;
          NoTypingAnimation.enabled = true;
          NoticesAPI.enabled = true;
          PermissionsViewer = {
            defaultPermissionsDropdownState = false;
            enabled = true;
            permissionsSortOrder = 0;
          };
          PlatformIndicators = {
            badges = true;
            colorMobileIndicator = true;
            enabled = true;
            list = true;
            messages = false;
          };
          RelationshipNotifier = {
            enabled = true;
            friendRequestCancels = true;
            friends = true;
            groups = true;
            notices = true;
            offlineRemovals = true;
            servers = true;
          };
          SearchReply.enabled = true;
          SendTimestamps.enabled = true;
          Settings = {
            enabled = true;
            settingsLocation = "aboveActivity";
          };
          SettingsStoreAPI.enabled = true;
          ShikiCodeblocks = {
            bgOpacity = 100;
            enabled = true;
            theme =
              "https://raw.githubusercontent.com/shikijs/shiki/"
              + "0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/github-dark-dimmed.json";
            tryHljs = "SECONDARY";
            useDevIcon = "GREYSCALE";
          };
          ShowHiddenChannels = {
            defaultAllowedUsersAndRolesDropdownState = true;
            enabled = true;
            hideUnreads = true;
            showMode = 1;
          };
          ShowTimeouts.enabled = true;
          SilentTyping = {
            enabled = true;
            isEnabled = true;
            showIcon = false;
          };
          SortFriendRequests = {
            enabled = true;
            showDates = false;
          };
          SupportHelper.enabled = true;
          Translate = {
            autoTranslate = false;
            enabled = true;
            receivedInput = "auto";
            receivedOutput = "en";
            sentInput = "auto";
            sentOutput = "en";
          };
          TypingIndicator = {
            enabled = true;
            includeBlockedUsers = false;
            includeMutedChannels = true;
            includeCurrentChannel = true;
          };
          TypingTweaks = {
            alternativeFormatting = true;
            enabled = true;
            showAvatars = true;
            showRoleColors = true;
          };
          UserVoiceShow = {
            enabled = true;
            showInUserProfileModal = true;
            showVoiceChannelSectionHeader = true;
          };
          UwUifier = {
            enabled = true;
            uwuEveryMessage = false;
          };
          ValidUser.enabled = true;
          ViewIcons = {
            enabled = true;
            format = "png";
            imgSize = "4096";
          };
          ViewRaw = {
            clickMethod = "Left";
            enabled = true;
          };
          WhoReacted.enabled = true;
          ChatInputButtonAPI.enabled = true;
          ServerListAPI.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          FriendsSince.enabled = true;
          MessageClickActions.enabled = true;
          ReverseImageSearch.enabled = true;
          Unindent.enabled = true;
          VoiceChatDoubleClick.enabled = true;
          WebContextMenus = {
            enabled = true;
            addBack = true;
          };
          WebKeybinds.enabled = true;
        };
        themeLinks = [
          "https://raw.githubusercontent.com/orblazer/discord-nordic/master/nordic.vencord.css"
        ];
        transparent = false;
        useQuickCss = false;
        winCtrlQ = false;
        winNativeTitleBar = false;
      };

      "vesktop/settings.json".text = builtins.toJSON {
        arRPC = "on";
        discordBranch = "stable";
        hardwareAcceleration = false;
        minimizeToTray = "on";
        splashBackground = "rgb(59, 66, 82)";
        splashColor = "rgb(216, 222, 233)";
        splashTheming = true;
        tray = true;
      };
    };

    home.packages = [cfg.finalPackage];
  };
}
