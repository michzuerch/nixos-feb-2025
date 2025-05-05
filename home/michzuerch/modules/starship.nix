{
  lib,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 2000;
      format = lib.concatStrings [
        "[](fg:#303030)"
        "$os(bg:#707070 fg:#303030)"
        "[](bg:#303030 fg:#707070)"
        "$directory"
        "$git_branch"
        "$git_status"
        "[](#303030)"
        "$fill"
        "[](#303030)"
        "$status"
        "$cmd_duration"
        "[ ](bg:#303030 fg:#909090)"
        "$username"
        "$hostname"
        "[ ](bg:#303030 fg:#909090)"
        "$time"
        "[ ](bg:#303030 fg:#567676)"

        # "[](color_orange)"
        # "$os"
        # "$hostname"
        # "$username (config.lib.stylix.colors.base00)"
        # "[](bg:color_yellow fg:color_orange)"
        # "$directory"
        # "[](fg:color_yellow bg:color_aqua)"
        # "$git_branch"
        # "$git_status"
        # "[](fg:color_aqua bg:color_blue)"
        # "$c"
        # "$cpp"
        # "$rust"
        # "$golang"
        # "$nodejs"
        # "$php"
        # "$java"
        # "$kotlin"
        # "$haskell"
        # "$python"
        # "[](fg:color_blue bg:color_bg3)"
        # "$docker_context"
        # "$conda"
        # "$pixi"
        # "[](fg:color_bg3 bg:color_bg1)"
        # "$time"
        # "$cmd_duration"
        # "[ ](fg:color_bg1)"
        # "$direnv"
        # "$nix_shell"
        # "$username"
        # "$line_break"
        # "$character"
      ];

      fill = {
        symbol = " ";
      };

      os = {
        disabled = false;
        style = "bg:#303030 fg:#769ff0";
        symbols = {
          NixOS = "❄️ ";
        };
      };

      directory = {
        format = "[$path](bg:#303030 fg:#707070)[$read_only](bg:#303030 fg:#d79921)";
        read_only = "";
        home_symbol = "󱂵";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          Source = "󰲋 ";
        };
      };

      # git_branch = {
      #   symbol = "";
      #   style = "bg:#303030 fg:#707070";
      #   format = "on [$symbol$branch]";
      # };

      # git_status = {
      #   style = "bg:color_aqua";
      #   format = "Status [[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";
      # };

      username = {
        show_always = true;
        style_user = "bg:color_orange fg:color_fg0";
        style_root = "bg:color_orange fg:color_fg0";
        format = "[  $user ]($style)";
      };

      hostname = {
        disabled = false;
        format = "╱[  $hostname ]($style)";
        trim_at = ".";
        style = "bg:color_orange fg:color_fg0";
      };

      direnv = {
        disabled = false;
        format = "╱ direnv [$loaded/$allowed ]($style)";
        allowed_msg = "";
        not_allowed_msg = "";
        denied_msg = "";
        loaded_msg = "";
        unloaded_msg = "";
      };

      nix_shell = {
        disabled = false;
        format = "╱ nix-shell [$symbol $state(\\($name\\)) ]($style)";
        symbol = "";
        style = "bold cyan";
        impure_msg = "[ ](bold red)";
        pure_msg = "[ ](bold green)";
        unknown_msg = "[ ](dimmed yellow)";
      };

      nodejs = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:color_blue";
        format = "'[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:color_blue";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:color_bg3";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)";
      };

      conda = {
        style = "bg:color_bg3";
        format = "[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)";
      };

      pixi = {
        style = "bg:color_bg3";
        format = "[[ $symbol( $version)( $environment) ](fg:color_fg0 bg:color_bg3)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      cmd_duration = {
        disabled = false;
        min_time = 500;
        show_milliseconds = false;
        format = "╱ [took](dimmed)[ $duration ]($style)";
        style = "dimmed yellow";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };
    };
  };
}
