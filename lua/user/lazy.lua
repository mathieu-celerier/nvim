require("lazy").setup({
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim"},           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    config = function()
      require("user.configs.lsp_zero")
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("user.configs.ts")
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "mfussenegger/nvim-dap" },
    },
    config = function()
      require("user.configs.rust_tools")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("user.configs.neo_tree")
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "v1.*",
    config = function()
      require("user.configs.nvim_window_picker")
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("user.configs.which_key")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("user.configs.catppuccin")
    end,
  },
  { "mrjones2014/smart-splits.nvim" },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("user.configs.bufferline")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("user.configs.gitsings")
    end,
  },
  { "tpope/vim-fugitive" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("user.configs.dapui")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    config = function()
      require("mini.bufremove").setup()
    end,
  },
  { "SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig" },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end,
  },
  -- {
  -- 	"folke/noice.nvim",
  -- 	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  -- 	config = function()
  -- 		require("user.configs.noice")
  -- 	end,
  -- },
  { "mbbill/undotree" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.configs.lualine")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.configs.alpha")
    end,
  },
  { "jay-babu/mason-nvim-dap.nvim" },
  { "rebelot/heirline.nvim" },
  { dir = "~/perso/aws_nvim" },
  { dir = "~/perso/foo" },
  {"lervag/vimtex"},
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    -- build = "cd app && yarn install",
    build = ":call mkdp#util#install()",
  },
})
