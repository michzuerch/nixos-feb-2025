{lib, ...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 2000;
      format = lib.concatStrings [
        "[](#303030)"
        "$os(bg:#707070 fg:#303030)"
        "[](bg:#303030 fg:#707070)"
        "$directory"
        "$git_branch(bg:#707070 fg:#303030)"
        "$git_metrics(bg:#707070 fg:#303030)"
        "$git_status(bg:#707070 fg:#303030)"
        # "$git_state(bg:#707070 fg:#303030)"
        "[](#303030)"
        "$direnv"
        "$nodejs"
        "$c"
        "$cpp"
        "$rust"
        "$golang"
        "$java"
        "$kotlin"
        "$python"
        "$docker_context"
        "$conda"
        "$pixi"
        "$fill"
        "[](#303030)"
        "$status"
        "$cmd_duration"
        "[ ](bg:#303030 fg:#909090)"
        "$username"
        "$hostname"
        "[ ](bg:#303030 fg:#909090)"
        "$time"
        "$line_break"
        "$character"
      ];

      fill = {
        symbol = " ";
      };

      os = {
        disabled = false;
        style = "fg:#769ff0 bg:#303030";
        symbols = {
          NixOS = "❄️ ";
        };
      };

      directory = {
        read_only = "  ";
        home_symbol = "󱂵 ";
        truncation_length = 3;
        truncation_symbol = "…/";
        truncate_to_repo = true;
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = "󰝚 ";
          Pictures = " ";
          Source = "󰲋 ";
        };
        style = "fg:#FFFFFF bg:#303030";
        format = " [$path]($style)[$read_only](bg:#303030 fg:#d79921)";
      };

      git_branch = {
        symbol = "";
        format = "[ $symbol( $branch) ](fg:#FFFFFF bg:#303030)";
      };

      #      git_status = {
      #        ahead = "⇡{$count}";
      #        diverged = "⇕⇡${ahead_count}⇣${behind_count}";
      #        behind = "⇣${count}";
      #        staged = "[$count]";
      #        conflicted = "";
      #        renamed = "󰑕";
      #        deleted = "󰆳";
      #        format = "([\\[$all_status$ahead_behind\\] ](fg:#FFFFFF bg:#303030 ))";
      #      };

      git_metrics = {
        added_style = "fg:#FFFFFF bg:#303030";
        deleted_style = "fg:#FFFFFF bg:#303030";
        format = "metrics [+$added]($added_style)/[-$deleted]($deleted_style) ";
      };

      git_state = {
        rebase = "󰃻";
        cherry_pick = "";
        merge = "";
        bisect = "󱁉";
        style = "fg:#FFFFFF bg:#303030";
        format = ''[\($state( $progress_current/$progress_total) \)]($style)'';
      };

      username = {
        show_always = true;
        style_user = "bg:#303030 fg:#FFFFFF";
        style_root = "bg:#303030 fg:red";
        format = "[  $user ]($style)";
      };

      hostname = {
        disabled = false;
        ssh_only = false;
        trim_at = ".";
        ssh_symbol = "󰍂";
        style = "fg:#FFFFFF bg:#303030";
        format = "[  $ssh_symbol $hostname ]($style)";
      };

      direnv = {
        disabled = false;
        allowed_msg = "";
        not_allowed_msg = "";
        denied_msg = "";
        loaded_msg = "";
        unloaded_msg = "";
        style = "fg:#FFFFFF";
        format = "[$loaded/$allowed ]($style)";
      };

      nix_shell = {
        disabled = false;
        symbol = "";
        impure_msg = "[ ](bold red)";
        pure_msg = "[ ](bold green)";
        unknown_msg = "[ ](dimmed yellow)";
        style = "bg:#303030 fg:#FFFFFF";
        format = "╱ nix-shell [$symbol $state(\\($name\\)) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#303030 fg:#FFFFFF";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:#303030 fg:#707070";
        format = "'[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      java = {
        symbol = "";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#303030 fg:#707070";
        format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "fg:#FFFFFF bg:#303030";
        format = "[[ $symbol( $context) ](fg:#FFFFFF bg:#303030)]($style)";
      };

      conda = {
        style = "fg:#FFFFFF bg:#303030";
        format = "[[ $symbol( $environment) ](fg:#FFFFFF bg:#303030)]($style)";
      };

      pixi = {
        style = "fg:#FFFFFF bg:#303030";
        format = "[[ $symbol( $version)( $environment) ](fg:#FFFFFF bg:#303030)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:#FFFFFF bg:#303030";
        format = "[  $time ]($style)";
      };

      cmd_duration = {
        disabled = false;
        min_time = 500;
        show_milliseconds = false;
        style = "fg:#FFFFFF bg:#303030";
        format = "[ 󱇝 $duration ]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:#FFFFFF)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:green)";
        vimcmd_replace_one_symbol = "[](bold fg:purple)";
        vimcmd_replace_symbol = "[](bold fg:purple)";
        vimcmd_visual_symbol = "[](bold fg:yellow)";
      };
    };
  };
}
