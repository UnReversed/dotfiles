{
  inputs,
  pkgs,
  ...
}: let
  addons = inputs.firefox-addons.packages.${pkgs.system};
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

      bookmarks = [
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

      extensions = with addons; [
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
      ];
    };
  };
}
