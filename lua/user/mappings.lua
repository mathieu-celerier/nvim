local wk = require("which-key")
local set = vim.api.nvim_set_keymap

wk.register({
  ["<leader>"] = {
    g = {
      name = "Git",
      s = { ":G<CR>", "Git status" },
      c = { ":Git commit<CR>", "Git commit" },
      b = { ":Telescope git_branches<CR>", "Git branches" },
      h = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
    },
    e = { ":Neotree toggle<CR>", "Toggle file tree" },
    x = { "<cmd>lua MiniBufremove.delete()<CR>", "Close current buffer" },
    f = {
      name = "Files",
      s = { ":Telescope live_grep<CR>", "Search in files using Telescope" },
      f = { ":Telescope find_files<CR>", "Search files using Telescope" },
    },
    l = {
      name = "LSP",
      o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open LSP diagnostic window" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Open loclist using split buffer" },
      l = { ":Telescope loclist<CR>", "Open loclist using Telescope" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
      f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
      h = {
        function() vim.lsp.buf.hover() end,
        "Toggle LSP hover",
      },
      t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble.nvim" },
    },
    -- h = {
    -- 	name = "Harpoon",
    -- 	m = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Mark file" },
    -- 	n = { '<cmd>lua require("harpoon.ui").nav_next()<CR>', "Navigate to next file" },
    -- 	N = { '<cmd>lua require("harpoon.ui").nav_prev()<CR>', "Navigate to previous file" },
    -- 	["1"] = { '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', "Navigate to file 1" },
    -- 	["2"] = { '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', "Navigate to file 2" },
    -- 	["3"] = { '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', "Navigate to file 3" },
    -- 	["4"] = { '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', "Navigate to file 4" },
    -- },
    c = {
      function() require("Comment.api").toggle.linewise.current() end,
      "Comment current line",
    },
    d = {
      name = "DAP",
      t = { '<cmd>lua require("dapui").toggle()<CR>', "Toggle" },
      b = { '<cmd>lua require("dap").toggle_breakpoint()<CR>', "Toggle breakpoint" },
      c = { '<cmd>lua require("dap").continue()<CR>', "Continue" },
      n = { '<cmd>lua require("dap").step_over()<CR>', "Step over" },
      i = { '<cmd>lua require("dap").step_into()<CR>', "Step into" },
      r = { '<cmd>lua require("dap").repl.open()<CR>', "Open REPL" },
    },
  },
})

-- Visual mode mappings

wk.register({
  ["<leader>"] = {
    g = {
      name = "Git",
      h = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
    },
    c = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      "Comment selected block",
    },
  },
}, { mode = "v" })

-- Navigation improvements
set("n", "<Esc>", ":nohl<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

vim.keymap.set("n", "<C-[>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<C-]>", "<cmd>lua vim.diagnostic.goto_next()<CR>")

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Bufferline
set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, noremap = true })
set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, noremap = true })

-- Autocmd
--vim.cmd([[autocmd BufWritePre * lua vim.diagnostic.setloclist({open=false})]])
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function() vim.diagnostic.setloclist({ open = false }) end,
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		require("lsp-zero.server").format_cmd()
-- 	end,
-- })
