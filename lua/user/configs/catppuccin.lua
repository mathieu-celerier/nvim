require("catppuccin").setup({
  flavour = "mocha",
  term_colors = true,
  integrations = {
    dap = {
      enabled = true,
      enable_ui = true, -- enable nvim-dap-ui
    },
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
  },
})

require("catppuccin").load(require("catppuccin").options.flavour)
