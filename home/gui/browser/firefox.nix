{
  firefox-addons,
  pkgs,
  ...
}: let
  addons = firefox-addons.packages.${pkgs.system};
in {
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "browser.startup.page" = 3;
        # autoload extensions
        "extensions.autoDisableScopes" = 0;
        # disable "save password"
        "signon.rememberSignons" = false;

        "browser.uitour.enabled" = false;
        #dark mode
        "browser.theme.content-theme" = 0;
        "browser.theme.toolbar-theme" = 0;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "browser.theme.dark-private-windows" = true;

        # few first time launch stuff
        "browser.feeds.showFirstRunUI" = false;
        "browser.disableResetPrompt" = true;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "home-manager options";
                url = "https://home-manager-options.extranix.com/";
              }
              {
                name = "nix search packages";
                url = "https://search.nixos.org/packages";
              }
              {
                name = "mynixos";
                url = "https://mynixos.com/options";
              }
              {
                name = "nix-versions";
                url = "https://lazamar.co.uk/nix-versions/";
              }
            ];
          }
        ];
      };
      extensions = {
        force = true;
        packages = with addons; [
          multi-account-containers
          ublock-origin
          darkreader
          sponsorblock
          return-youtube-dislikes
          consent-o-matic
          clearurls
          buster-captcha-solver
          keepassxc-browser
          localcdn
          sidebery
          auto-tab-discard
        ];
        settings = {
          "uBlock0@raymondhill.net" = {
            force = true;
            settings = {
              selectedFilterLists = [
                "user-filters"
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "easylist"
                "adguard-generic"
                "adguard-mobile"
                "easyprivacy"
                "adguard-spyware"
                "adguard-spyware-url"
                "block-lan"
                "urlhaus-1"
                "curben-phishing"
                "plowe-0"
                "dpollock-0"
                "fanboy-cookiemonster"
                "ublock-cookies-easylist"
                "adguard-cookies"
                "ublock-cookies-adguard"
                "fanboy-social"
                "adguard-social"
                "fanboy-thirdparty_social"
                "easylist-chat"
                "easylist-newsletters"
                "easylist-notifications"
                "easylist-annoyances"
                "adguard-mobile-app-banners"
                "adguard-other-annoyances"
                "adguard-popup-overlays"
                "adguard-widgets"
                "ublock-annoyances"
                "POL-0"
                "POL-2"
              ];
              whitelist = [
                "chrome-extension-scheme"
                "moz-extension-scheme"
                "portal.azure.com"
              ];
              dynamicFilteringString = "behind-the-scene * * noop\nbehind-the-scene * inline-script noop\nbehind-the-scene * 1p-script noop\nbehind-the-scene * 3p-script noop\nbehind-the-scene * 3p-frame noop\nbehind-the-scene * image noop\nbehind-the-scene * 3p noop";
              hostnameSwitchesString = "no-large-media: behind-the-scene false\nno-csp-reports: * true";
            };
          };
        };
      };
    };
  };
}
