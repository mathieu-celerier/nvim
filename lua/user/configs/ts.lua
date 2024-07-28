require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.filetype.add({
  extensions = {
    mdx = "mdx",
  }
})

vim.treesitter.language.register("markdown", "mdx")
