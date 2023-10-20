require("bufferline").setup({
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "neo-tree", text = "File tree", text_align = "left" } },
  },
})
