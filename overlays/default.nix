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
