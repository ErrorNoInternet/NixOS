{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.customPrograms.discord;
  inherit (lib) mkEnableOption mkIf;
in {
  options.customPrograms.discord.enable =
    mkEnableOption "";

  config = mkIf cfg.enable {
    home = {
      file."${config.xdg.configHome}/Vencord/settings/settings.json" = {
        force = true;
        text = builtins.toJSON {
          notifyAboutUpdates = true;
          autoUpdate = false;
          autoUpdateNotification = true;
          useQuickCss = false;
          themeLinks = [
            "https://raw.githubusercontent.com/orblazer/discord-nordic/master/nordic.vencord.css"
          ];
          enableReactDevtools = false;
          frameless = false;
          transparent = false;
          winCtrlQ = false;
          macosTranslucency = false;
          disableMinSize = false;
          winNativeTitleBar = false;
          plugins = {
            BadgeAPI.enabled = true;
            CommandsAPI.enabled = true;
            ContextMenuAPI.enabled = true;
            MemberListDecoratorsAPI.enabled = true;
            MessageAccessoriesAPI.enabled = true;
            MessageDecorationsAPI.enabled = true;
            MessageEventsAPI.enabled = true;
            MessagePopoverAPI.enabled = true;
            NoticesAPI.enabled = true;
            SettingsStoreAPI.enabled = true;
            NoTrack.enabled = true;
            Settings = {
              enabled = true;
              settingsLocation = "aboveActivity";
            };
            AnonymiseFileNames = {
              enabled = false;
              method = 0;
              randomisedLength = 10;
              consistent = "image";
            };
            BetterFolders = {
              enabled = true;
              sidebar = true;
              sidebarAnim = true;
              closeAllFolders = false;
              closeAllHomeButton = false;
              closeOthers = false;
              forceOpen = false;
              showFolderIcon = 1;
              keepIcons = false;
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
            CrashHandler = {
              enabled = true;
              attemptToPreventCrashes = true;
              attemptToNavigateToHome = false;
            };
            EmoteCloner.enabled = true;
            Experiments = {
              enabled = true;
              enableIsStaff = false;
              forceStagingBanner = false;
            };
            FakeNitro = {
              enabled = true;
              enableEmojiBypass = true;
              emojiSize = 48;
              transformEmojis = true;
              enableStickerBypass = true;
              stickerSize = 160;
              transformStickers = true;
              transformCompoundSentence = false;
              enableStreamQualityBypass = true;
            };
            FavoriteEmojiFirst.enabled = true;
            ForceOwnerCrown.enabled = true;
            GifPaste.enabled = true;
            ImageZoom = {
              enabled = true;
              saveZoomValues = true;
              preventCarouselFromClosingOnClick = true;
              invertScroll = true;
              nearestNeighbour = false;
              square = false;
              zoom = 2.0;
              size = 792;
              zoomSpeed = 0.5;
            };
            KeepCurrentChannel.enabled = true;
            LoadingQuotes = {
              enabled = true;
              replaceEvents = true;
            };
            MemberCount.enabled = true;
            MessageLinkEmbeds = {
              enabled = true;
              automodEmbeds = "never";
              listMode = "blacklist";
              idList = "";
            };
            MessageLogger = {
              enabled = true;
              deleteStyle = "overlay";
              ignoreBots = false;
              ignoreSelf = false;
              ignoreUsers = "";
              ignoreChannels = "";
              ignoreGuilds = "";
            };
            MoreUserTags = {
              enabled = true;
              tagSettings = {
                WEBHOOK = {
                  text = "Webhook";
                  showInChat = true;
                  showInNotChat = true;
                };
                OWNER = {
                  text = "Owner";
                  showInChat = true;
                  showInNotChat = true;
                };
                ADMINISTRATOR = {
                  text = "Admin";
                  showInChat = true;
                  showInNotChat = true;
                };
                "MODERATOR_STAFF" = {
                  text = "Staff";
                  showInChat = false;
                  showInNotChat = false;
                };
                MODERATOR = {
                  text = "Mod";
                  showInChat = true;
                  showInNotChat = true;
                };
                "VOICE_MODERATOR" = {
                  text = "VC Mod";
                  showInChat = false;
                  showInNotChat = true;
                };
              };
            };
            MutualGroupDMs.enabled = true;
            NoF1.enabled = true;
            NoReplyMention = {
              enabled = true;
              userList = "372809091208445953 419880181101232129";
              shouldPingListed = false;
              inverseShiftReply = false;
            };
            NoTypingAnimation.enabled = true;
            PermissionsViewer = {
              enabled = true;
              permissionsSortOrder = 0;
              defaultPermissionsDropdownState = false;
            };
            PlatformIndicators = {
              enabled = true;
              list = true;
              badges = true;
              messages = false;
              colorMobileIndicator = true;
            };
            RelationshipNotifier = {
              enabled = true;
              notices = true;
              offlineRemovals = true;
              friends = true;
              friendRequestCancels = true;
              servers = true;
              groups = true;
            };
            SearchReply.enabled = true;
            SendTimestamps.enabled = true;
            ShikiCodeblocks = {
              enabled = true;
              useDevIcon = "GREYSCALE";
              theme =
                "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043"
                + "/packages/shiki/themes/github-dark-dimmed.json";
              tryHljs = "SECONDARY";
              bgOpacity = 100;
            };
            ShowHiddenChannels = {
              enabled = true;
              hideUnreads = true;
              showMode = 1;
              defaultAllowedUsersAndRolesDropdownState = true;
            };
            ShowTimeouts.enabled = true;
            SilentTyping = {
              enabled = true;
              showIcon = false;
              isEnabled = true;
            };
            SortFriendRequests = {
              enabled = true;
              showDates = false;
            };
            SupportHelper.enabled = true;
            Translate = {
              enabled = true;
              autoTranslate = false;
              receivedInput = "auto";
              receivedOutput = "en";
              sentInput = "auto";
              sentOutput = "en";
            };
            TypingIndicator = {
              enabled = true;
              includeMutedChannels = true;
              includeBlockedUsers = false;
            };
            TypingTweaks = {
              enabled = true;
              showAvatars = true;
              showRoleColors = true;
              alternativeFormatting = true;
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
              enabled = true;
              clickMethod = "Left";
            };
            WhoReacted.enabled = true;
          };
          notifications = {
            timeout = 5000;
            position = "bottom-right";
            useNative = "not-focused";
            logLimit = 50;
          };
          cloud = {
            authenticated = false;
            url = "https://api.vencord.dev/";
            settingsSync = false;
            settingsSyncVersion = 1704773064108;
          };
          enabledThemes = [];
        };
      };

      packages = let
        unwrapped-discord = pkgs.discord-canary.override {
          withOpenASAR = true;
          withVencord = true;
        };

        sandboxed-discord =
          (inputs.nixpak.lib.nixpak {inherit lib pkgs;} {
            config = {sloth, ...}: rec {
              app.package = unwrapped-discord;

              etc.sslCertificates.enable = true;
              flatpak.appId = "com.discordapp.DiscordCanary";

              dbus.policies = {
                "org.freedesktop.portal.Desktop" = "talk";
                "org.freedesktop.portal.Notification" = "talk";
                "org.freedesktop.portal.OpenURI" = "talk";
                "org.kde.StatusNotifierWatcher" = "talk";
                ${flatpak.appId} = "own";
              };

              fonts = {
                enable = true;
                fonts = with pkgs; [
                  cantarell-fonts
                  dejavu_fonts
                  gyre-fonts
                  liberation_ttf
                  noto-fonts-cjk-sans
                  noto-fonts-cjk-serif
                  source-code-pro
                  source-sans
                  twitter-color-emoji
                ];
              };

              bubblewrap = {
                bind = {
                  ro = [
                    "/etc/localtime"
                    (sloth.concat' sloth.xdgConfigHome "/gtk-3.0")
                    (sloth.concat' sloth.xdgDataHome "/icons")
                  ];
                  rw = [
                    (sloth.concat' sloth.xdgConfigHome "/discord")
                    (sloth.concat' sloth.xdgConfigHome "/discordcanary")
                    (sloth.concat' sloth.xdgConfigHome "/Vencord")
                  ];
                };

                sockets = {
                  pulse = true;
                  wayland = true;
                };
              };
            };
          })
          .config
          .script;
      in
        with pkgs; [
          (runCommand "DiscordCanary-wrapper" {} ''
            mkdir -p $out/bin

            cp -a ${unwrapped-discord}/opt $out
            cp -a ${unwrapped-discord}/share $out

            cat << EOF > $out/bin/DiscordCanary
            export PATH=$PATH:${lib.makeBinPath [xdg-utils]}
            ${lib.getExe sandboxed-discord} \
                --enable-features=UseOzonePlatform,WaylandWindowDecorations \
                --ozone-platform=wayland "$@"
            EOF
            chmod +x $out/bin/DiscordCanary
          '')
        ];
    };
  };
}
