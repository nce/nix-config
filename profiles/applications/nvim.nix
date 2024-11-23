{
  inputs,
  pkgs,
  ...
}:

{
  home = {
    packages = with pkgs; [
      gopls
      gofumpt
      gotools
      nixfmt-rfc-style
      nil
    ];
  };

  programs = {

    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
        # lsp
        {
          plugin = lsp-zero-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/lsp.lua;
        }
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        cmp-path
        cmp-cmdline
        cmp-git
        lspkind-nvim
        mason-nvim
        mason-lspconfig-nvim
        lspkind-nvim
        cmp-fuzzy-buffer
        fuzzy-nvim
        {
          plugin = hover-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/hover-nvim.lua;
        }

        render-markdown-nvim
        ChatGPT-nvim

        {
          plugin = nvim-surround;
          type = "lua";
          config = "require(\"nvim-surround\").setup()";
        }

        # misc/deps
        nvim-web-devicons
        plenary-nvim
        nui-nvim
        dressing-nvim

        # tmux resurrect
        vim-obsession

        {
          plugin = Navigator-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/navigator.lua;
        }

        # colorscheme
        transparent-nvim
        {
          plugin = rose-pine;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/rose-pine.lua;
        }

        {
          plugin = nvim-autopairs;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/nvim-autopairs.lua;
        }

        # telescope
        telescope-zoxide
        telescope-fzf-native-nvim
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/telescope-nvim.lua;
        }

        # lualine
        lualine-lsp-progress
        {
          plugin = lualine-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/lualine-nvim.lua;
        }

        {
          plugin = neo-tree-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/neo-tree-nvim.lua;
        }

        # treesitter
        nvim-treesitter-textobjects
        {
          plugin = nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/nvim-treesitter.lua;
        }

        {
          plugin = comment-nvim;
          type = "lua";
          config = "require('Comment').setup()";
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/gitsigns-nvim.lua;
        }

        {
          plugin = nvim-notify;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/notify.lua;
        }
        {
          plugin = noice-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/noice-nvim.lua;
        }

        vim-rhubarb
        {
          plugin = vim-fugitive;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/vim-fugitive.lua;
        }

        {
          plugin = harpoon2;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/harpoon2.lua;
        }

        {
          plugin = zen-mode-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/zen-mode-nvim.lua;
        }
        {
          plugin = conform-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/conform-nvim.lua;
        }
        {
          plugin = obsidian-nvim;
          type = "lua";
          config = builtins.readFile ./nvim/plugins/obsidian-nvim.lua;
        }
      ];

      extraLuaConfig = ''

        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/remap.lua}
      '';
    };
  };
}
