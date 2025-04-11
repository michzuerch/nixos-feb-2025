{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-devedition-bin;
    languagePacks = ["en-US" "de"];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles = {
      michzuerch = {
        id = 0;
        isDefault = true;
        name = "michzuerch";
        settings = {
          "dom.security.https_only_mode" = true;
          "browser.download.panel.shown" = true;
          "identity.fxaccounts.enabled" = false;
          "signon.rememberSignons" = false;
        };

        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
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
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@no"];
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nw"];
            };
            "Noogle" = {
              urls = [
                {
                  template = "https://noogle.dev?term={searchTerms}";
                }
              ];
              icon = "/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
              definedAliases = ["@nog"];
            };
          };
        };
        userChrome = ''
          /* some css */
        '';

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          wayback-machine
          vue-js-devtools
          rust-search-extension
          search-by-image
          proton-pass
          proton-vpn
          darkreader
          firefox-color
          about-sync
          #catppuccin-gh-file-explorer
          clearcache
          hacktools
          i-dont-care-about-cookies
          #print-friendly-pdf
          web-developer
        ];
      };
    };
  };
}
