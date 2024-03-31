{
  config,
  osConfig,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.home.programs.graphical.firefox;
  inherit (lib) mkEnableOption mkIf;
in {
  imports = [inputs.nur.nixosModules.nur];

  options.home.programs.graphical.firefox.enable =
    mkEnableOption "" // {default = config.profiles.desktop.enable;};

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      policies = {
        BlockAboutConfig = false;
        DefaultDownloadDirectory = "\${home}/downloads";
      };

      profiles.ErrorNoProfile = {
        name = "ErrorNoProfile";
        isDefault = true;

        extensions = with config.nur.repos.rycee.firefox-addons; [
          behind-the-overlay-revival
          darkreader
          nord123
          playback-speed
          privacy-badger
          return-youtube-dislikes
          ublock-origin
          user-agent-string-switcher
          vimium
        ];

        settings = {
          "app.normandy.api_url" = "";
          "app.normandy.enabled" = false;
          "app.normandy.first_run" = false;
          "app.shield.optoutstudies.enabled" = false;
          "beacon.enabled" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.discovery.enabled" = false;
          "browser.display.use_system_colors" = true;
          "browser.fixup.alternate.enabled" = false;
          "browser.formfill.enable" = false;
          "browser.newtabpage.enabled" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "browser.region.network.url" = "";
          "browser.region.update.enabled" = false;
          "browser.startup.homepage" = "chrome://browser/content/blanktab.html";
          "browser.tabs.firefox-view" = false;
          "browser.tabs.inTitlebar" = 0;
          "browser.theme.toolbar-theme" = 0;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.urlbar.dnsResolveSingleWordsAfterSearch" = false;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.suggest.searches" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "devtools.onboarding.telemetry.logged" = false;
          "dom.forms.autocomplete.formautofill" = false;
          "dom.security.https_first" = true;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.available" = "off";
          "extensions.formautofill.creditCards.available" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "extensions.formautofill.heuristics.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "general.autoScroll" = true;
          "identity.fxaccounts.account.device.name" = osConfig.host.name;
          "keyword.enabled" = true;
          "media.eme.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.globalprivacycontrol.enabled" = true;
          "privacy.globalprivacycontrol.was_ever_enabled" = true;
          "security.ask_for_password" = 1;
          "security.password_lifetime" = 0;
          "signon.autofillForms" = false;
          "signon.formlessCapture.enabled" = false;
          "signon.rememberSignons" = false;
          "toolkit.coverage.endpoint.base" = "";
          "toolkit.coverage.opt-out" = true;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.pioneer-new-studies-available" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "ui.key.menuAccessKeyFocuses" = false;
          "widget.use-xdg-desktop-portal.file-picker" = 1;
        };

        search = {
          default = "Google";

          engines = {
            "Google".metaData.alias = "@g";

            "Bing".metaData.alias = "@b";

            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };

            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nw"];
            };
          };
        };
      };
    };

    browser.name = "firefox";
  };
}
