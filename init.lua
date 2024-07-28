-- Lazy bootstrap from scratch
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_latexmk_build_dir = 'livepreview'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-shell-escape',
    '-synctex=1',
    '-interaction=nonstopmode'
  }
}
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_open_on_warning = 0

require("user.options")
require("user.lazy")
require("user.mappings")
require("user.ui")
