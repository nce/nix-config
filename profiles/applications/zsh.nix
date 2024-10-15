{
  pkgs,
  lib,
  ...
}:
with lib;

{
  home = {
    packages = with pkgs; [
      oh-my-posh
      fzf
      eza
      bat
    ];
  };

  programs = {
    zoxide = {
      enable = true;
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
  };

}
