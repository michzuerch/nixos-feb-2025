{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
        {id = "kfidecgcdjjfpeckbblhmfkhmlgecoff";} # Svelte dev tools
        {id = "pgamkpjkbfldnmemhcbekimfdnjcgkco";} # Tailwind css tools
      ];
    };
    brave = {enable = true;};
    qutebrowser = {enable = true;};

    firefox = {
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
            };
          };
          userChrome = ''
            /* some css */
          '';

          extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            ublock-origin
            wayback-machine
            vue-js-devtools
            rust-search-extension
            search-by-image
            proton-pass
            proton-vpn

            sponsorblock
            darkreader
            tridactyl
            youtube-shorts-block
          ];
        };
      };
    };
  };
}
