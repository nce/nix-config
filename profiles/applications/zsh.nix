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
      zsh-fzf-tab
    ];
  };

  programs = {

    zoxide = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;

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
        ls = "eza";
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
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
        [ -r ~/.orbstack/shell/init.zsh ] && source ~/.orbstack/shell/init.zsh
      '';

      initContent = ''
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color $realpath'
        # disable sort when completing `git checkout`
        zstyle ':completion:*:git-checkout:*' sort false
        # set descriptions format to enable group support
        # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
        zstyle ':completion:*:descriptions' format '[%d]'
        # set list-colors to enable filename colorizing
        #zstyle ':completion:*' list-colors "''${(s.:.) LS_COLORS}"
        # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
        zstyle ':completion:*' menu no
        # preview directory's content with eza when completing cd
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
        # custom fzf flags
        # NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
        zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
        # To make fzf-tab follow FZF_DEFAULT_OPTS.
        # NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
        zstyle ':fzf-tab:*' use-fzf-default-opts yes
        # switch group using `<` and `>`
        zstyle ':fzf-tab:*' switch-group '<' '>'

        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          tmux a -t default || exec tmux new -s default && exit;
        fi

        eval "$(atuin init zsh)"
      '';

      envExtra = ''
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
                "template" =
                  " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
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
