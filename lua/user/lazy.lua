require("lazy").setup({
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    config = function() require("user.configs.lsp_zero") end,
  },
  {
    "towolf/vim-helm",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require("user.configs.copilot_conf") end,
  },
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require("octo").setup() end,
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup() end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("user.configs.ts") end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    config = function() require("user.configs.rust_tools") end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function() require("user.configs.neo_tree") end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "v1.*",
    config = function() require("user.configs.nvim_window_picker") end,
  },
  {
    "folke/which-key.nvim",
    config = function() require("user.configs.which_key") end,
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function() require("user.configs.catppuccin") end,
  },
  { "mrjones2014/smart-splits.nvim" },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
    config = function() require("user.configs.bufferline") end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("user.configs.gitsings") end,
  },
  { "tpope/vim-fugitive" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function() require("user.configs.dapui") end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function() require("mini.bufremove").setup() end,
  },
  { "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        show_end = false,
        show_start = false,
      },
      indent = {
        char = "▏",
      },
    },
  },
  { "mbbill/undotree" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function() require("toggleterm").setup() end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("user.configs.lualine") end,
  },
  {
    "numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  },
  {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function() require("user.configs.alpha") end,
  },
  { "jay-babu/mason-nvim-dap.nvim" },
  -- { dir = "~/perso/aws_nvim" },
  -- { dir = "~/perso/foo" },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    config = function() require("user.configs.neorg_conf") end,
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup({
        -- your neotest config here
        adapters = {
          require("neotest-go"),
        },
      })
    end,
  },
  { "lervag/vimtex" },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        strict = true,
        override_by_extensions = {
          astro = {
            icon = "",
            color = "#EF8547",
            name = "astro",
          },
        },
      })
    end,
  },
})
