self: super:

{
  tmuxPlugins = self.lib.recursiveUpdate super.tmuxPlugins {
    catppuccin = self.tmuxPlugins.mkTmuxPlugin {
      pluginName = "catppuccin";
      version = "unstable-2024-10-19";
      src = self.fetchFromGitHub {
        owner = "catppuccin";
        repo = "tmux";
        rev = "10aac293a892125ea9f895fd4348ed90baab649d";
        hash = "sha256-p0xrk4WXNoVJfekA/L3cxIVrLqjFbBe2S/rc/6JXz6M=";
      };
    };
    tmux-sessionx = self.tmuxPlugins.mkTmuxPlugin {
      pluginName = "sessionx";
      version = "unstable-2024-09-22";
      src = self.fetchFromGitHub {
        owner = "omerxx";
        repo = "tmux-sessionx";
        rev = "508359b8a6e2e242a9270292160624406be3bbca";
        hash = "sha256-nbzn3qxMGRzxFnLBVrjqGl09++9YOK4QrLoYiHUS9jY=";
      };
      nativeBuildInputs = [ self.pkgs.makeWrapper ];
      postPatch = ''
        substituteInPlace sessionx.tmux \
          --replace "\$CURRENT_DIR/scripts/sessionx.sh" "$out/share/tmux-plugins/sessionx/scripts/sessionx.sh"
        substituteInPlace scripts/sessionx.sh \
          --replace "/tmux-sessionx/scripts/preview.sh" "$out/share/tmux-plugins/sessionx/scripts/preview.sh"
        substituteInPlace scripts/sessionx.sh \
          --replace "/tmux-sessionx/scripts/reload_sessions.sh" "$out/share/tmux-plugins/sessionx/scripts/reload_sessions.sh"
      '';
      postInstall = ''
        chmod +x $target/scripts/sessionx.sh
        wrapProgram $target/scripts/sessionx.sh \
          --prefix PATH : ${
            with self.pkgs;
            lib.makeBinPath [
              zoxide
              fzf
              gnugrep
              gnused
              coreutils
            ]
          }
        chmod +x $target/scripts/preview.sh
        wrapProgram $target/scripts/preview.sh \
          --prefix PATH : ${
            with self.pkgs;
            lib.makeBinPath [
              coreutils
              gnugrep
              gnused
            ]
          }
        chmod +x $target/scripts/reload_sessions.sh
        wrapProgram $target/scripts/reload_sessions.sh \
          --prefix PATH : ${
            with self.pkgs;
            lib.makeBinPath [
              coreutils
              gnugrep
              gnused
            ]
          }
      '';
      meta = {
        description = "A Tmux session manager, with preview, fuzzy finding, and MORE";
        homepage = "https://github.com/omerxx/tmux-sessionx";
        license = self.lib.licenses.gpl3Only;
        platforms = self.lib.platforms.all;
      };
    };

  };

  vimPlugins = self.lib.recursiveUpdate super.vimPlugins {
    lsp-zero-nvim = self.vimUtils.buildVimPlugin {
      pname = "lsp-zero-nvim";
      version = "unstable-2024-10-19";
      src = self.fetchFromGitHub {
        owner = "VonHeikemen";
        repo = "lsp-zero.nvim";
        rev = "19a8b90340c6c522219c84f7befe784d657ab28e";
        hash = "sha256-tXllggyw7sm8zwOHrn+2mcTHch6Vp1u3BhjxvH+VCbA=";
      };
    };

  };

  tourenbuchctl = super.callPackage ./tourenbuchctl { };
}
