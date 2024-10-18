self: super:

{
    vimPlugins = self.lib.recursiveUpdate super.vimPlugins {
    lsp-zero-nvim = self.vimUtils.buildVimPlugin {
      pname = "lsp-zero-nvim";
      version = "4.0";
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
