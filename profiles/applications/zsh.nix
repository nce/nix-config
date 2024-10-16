{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      eza
      bat
      ripgrep
      fd
    ];
  };

  programs = {

    zoxide = {
      enable = true;
    };

    fzf = {
      enable = true;

      defaultCommand = "fd --type f";
      fileWidgetCommand = "fd --type f";
    };

    zsh = {
      enable = true;

      history = {
        append = true;
        ignoreAllDups = true;
      };

      autosuggestion = {
        enable = true;
      };

      syntaxHighlighting.enable = true;

      zplug.enable = true;
      zplug.plugins = [
        {
          name = "plugins/git";
          tags = [
            "from:oh-my-zsh"
          ];
        }
        {
          name = "plugins/eza";
          tags = [
            "from:oh-my-zsh"
          ];
        }

      ];

      shellAliases = {
        l = "eza -l --icons --git -a";
        ll = "l";
        lt = "eza --tree --level 2 --long --icons --git";
        vim = "nvim";
        vi = "nvim";
        ".." = "cd ..";
        "..." = "cd ../..";
        tree = "eza --tree";
        eza = "eza --icons always";
        cat = "bat";
      };

      profileExtra = ''
        [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
        #        export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
        #        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        #          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        #        fi
      '';

      initExtra = ''
        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
          eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/ohmyposh.toml)"
        fi

        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      '';

      envExtra = ''
        export FZF_DEFAULT_COMMAND="fd --type f"
        export FZF_CTRL_T_COMMAND="fd --type f"
        export FZF_ALT_C_COMMAND="fd --type d"

        export EDITOR=vim
      '';
    };

    oh-my-posh = {
      enable = true;

      settings = {

        "version" = 2;
        "final_space" = true;
        "console_title_template" = "{{ .Shell }} in {{ .Folder }}";
        "blocks" = [
          {
            "type" = "prompt";
            "alignment" = "left";
            "newline" = true;
            "segments" = [
              {
                "type" = "path";
                "style" = "plain";
                "background" = "transparent";
                "foreground" = "blue";
                "template" = "{{ .Path }}";
                "properties" = {
                  "style" = "full";
                };
              }
              {
                "type" = "kubectl";
                "style" = "plain";
                "powerline_symbol" = "";
                "foreground" = "yellow";
                "background" = "transparent";
                "template" = " ⎈ {{.Context}}{{if .Namespace}}  = = {{.Namespace}}{{end}}";
              }
              {
                "type" = "git";
                "style" = "plain";
                "foreground" = "p =grey";
                "background" = "transparent";
                "template" = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
                "properties" = {
                  "branch_icon" = "";
                  "commit_icon" = "@";
                  "fetch_status" = true;
                };
              }
            ];
          }
          {
            "type" = "rprompt";
            "overflow" = "hidden";
            "segments" = [
              {
                "type" = "executiontime";
                "style" = "plain";
                "foreground" = "yellow";
                "background" = "transparent";
                "template" = "{{ .FormattedMs }}";
                "properties" = {
                  "threshold" = 5000;
                };
              }
            ];
          }
          {
            "type" = "prompt";
            "alignment" = "left";
            "newline" = true;
            "segments" = [
              {
                "type" = "text";
                "style" = "plain";
                "foreground_templates" = [
                  "{{if gt .Code 0}}red{{end}}"
                  "{{if eq .Code 0}}magenta{{end}}"
                ];
                "background" = "transparent";
                "template" = "❯";
              }
            ];
          }
        ];
        "transient_prompt" = {
          "foreground_templates" = [
            "{{if gt .Code 0}}red{{end}}"
            "{{if eq .Code 0}}magenta{{end}}"
          ];
          "background" = "transparent";
          "template" = " ⎈ {{ .Segments.Kubectl.Context }} ❯ ";
        };
        "secondary_prompt" = {
          "foreground" = "magenta";
          "background" = "transparent";
          "template" = "❯❯ ";
        };
      };
    };

  };

}
