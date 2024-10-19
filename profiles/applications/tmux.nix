{
  pkgs,
  ...
}:

{
  programs = {

    fzf = {
      tmux.enableShellIntegration = true;
    };

    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      prefix = "C-a";

      clock24 = true;

      mouse = true;
      terminal = "tmux-256color";
      newSession = true;
      sensibleOnTop = true;

      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.battery
        {
          plugin = tmuxPlugins.tmux-fzf;
          extraConfig = ''
            TMUX_FZF_LAUNCH_KEY="F"
          '';
        }
        {
          plugin = tmuxPlugins.tmux-floax;
          extraConfig = ''
            set -g @floax-bind 'f'
            set -g @floax-bind-menu 'F'
            bind-key p prev # rebind p to have ctrl-a + p switch to previous window again
          '';
        }
        {
          plugin = tmuxPlugins.tmux-sessionx;
          extraConfig = ''
            set -g @sessionx-bind 'o'
            set -g @sessionx-zoxide-mode 'on'
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '15' # minutes
          '';
        }
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_window_status_style "rounded"
            set -g @catppuccin_window_number_position "right"

            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_default_text "#W"

            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#W"

            set -g @catppuccin_status_left_separator  " "
            set -g @catppuccin_status_right_separator ""
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_status_connect_separator "no"

            set -g @catppuccin_directory_text "#{pane_current_path}"

            set -g status-left ""
            set -g  status-right "#{E:@catppuccin_status_directory}"
            set -ag status-right "#{E:@catppuccin_status_user}"
            set -ag status-right "#{E:@catppuccin_status_host}"
            set -ag status-right "#{E:@catppuccin_status_session}"
          '';
        }
      ];

      extraConfig = ''
        bind a send-prefix               # use a to go to the start of line
        set -g renumber-windows on       # renumber all windows when any window is closed
        set -g base-index 1              # start indexing windows at 1 instead of 0
        set -g set-clipboard on          # use system clipboard
        set -g status-position top       # macOS / darwin style
        set-option -g focus-events on    # nvim suggestion

        set -sa terminal-features ",xterm-kitty*:RGB"

        # workaround for /bin/sh as default shell: https://github.com/nix-community/home-manager/issues/5952
        set -g default-command "$SHELL"
      '';
    };
  };
}
