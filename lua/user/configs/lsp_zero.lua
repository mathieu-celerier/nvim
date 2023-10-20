local lsp = require("lsp-zero").preset({
  name = "recommended",
  set_lsp_keymaps = true,
  manage_nvim_cmp = {
    set_sources = "recommended",
  },
  suggest_lsp_servers = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

require("nvim-navic").setup({ highlight = true })

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()
end)

lsp.configure("tailwindcss", {
  filetypes = { "rust" },
  init_options = {
    userLanguages = {
      rust = "html",
      svelte = "html",
    },
  },
})

require('lspconfig').clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
    '--function-arg-placeholders',
    '--completion-style=detailed',
    '--header-insertion=never',
    '--clang-tidy'
  }
})

lsp.setup()

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
})

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    })
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()

require("mason-nvim-dap").setup({
  automatic_setup = true,
})
require("mason-nvim-dap").setup_handlers({})
