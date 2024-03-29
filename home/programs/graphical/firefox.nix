{
  config,
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

        extensions = with config.nur.repos.rycee.firefox-addons; [
          behind-the-overlay-revival
          darkreader
          kristofferhagen-nord-theme
          privacy-badger
          return-youtube-dislikes
          ublock-origin
          user-agent-string-switcher
          vimium
        ];

        search = {
          default = "Google";

          engines = {
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
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 86400 * 1000;
              definedAliases = ["@nw"];
            };
          };
        };
      };
    };

    browser.name = "firefox";
  };
}
