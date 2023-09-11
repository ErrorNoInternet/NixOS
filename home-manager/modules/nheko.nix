{ secrets, ... }:

{
    programs.nheko = {
        enable = true;
        settings = {
            general.disableCertificateValidation = false;
            auth = secrets.nheko.auth;
            settings.scaleFactor = 1.0;
            user = {
                alertOnNotification = false;
                animateImagesOnHover = false;
                automaticallyShareKeysWithTrustedUsers = false;
                avatarCircles = false;
                bubblesEnabled = false;
                camera = "BisonCam, NB Pro: BisonCam, NB";
                cameraFrameRate = 30;
                cameraResolution = "640x480";
                decryptNotificatons = false;
                decryptSidebar = false;
                desktopNotifications = true;
                exposeDbusApi = false;
                fancyEffects = true;
                fontSize = 10;
                groupView = true;
                invertEnterKey = false;
                markdownEnabled = true;
                microphone = "Built-in Audio Analog Stereo";
                minorEvents = true;
                mobileMode = false;
                mutedTags = "global";
                onlineKeyBackup = true;
                onlyShareKeysWithVerifiedUsers = false;
                openImageExternal = false;
                openVideoExternal = false;
                presence = "AutomaticPresence";
                privacyScreen = false;
                privacyScreenTimeout = 0;
                readReceipts = true;
                reducedMotion = false;
                ringtone = "Default";
                screenShareFrameRate = 5;
                screenShareHideCursor = false;
                screenSharePip = true;
                screenShareRemoteVideo = false;
                scrollbarsInRoomlist = false;
                "sidebar\\communityListWidth" = 44;
                "sidebar\\roomListWidth" = 260;
                smallAvatarsEnabled = false;
                sortByUnread = true;
                spaceNotifications = true;
                theme = "dark";
                "timeline\\buttons" = true;
                "timeline\\enlargeEmojiOnlyMsg" = false;
                "timeline\\maxWidth" = 0;
                "timeline\\messageHoverHighlight" = true;
                typingNotifications = true;
                useIdenticon = true;
                useStunServer = false;
                "window\\startInTray" = false;
                "window\\tray" = true;
            };
        };
    };
}
