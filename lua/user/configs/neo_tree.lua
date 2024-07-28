local ok, neo_tree = pcall(require, "neo-tree")
if not ok then return end

vim.g.neo_tree_remove_legacy_commands = true

neo_tree.setup({
  use_popups_for_input = false,
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open_with_window_picker",
      ["<TAB>"] = "open_with_window_picker",
      ["<CR>"] = "open_with_window_picker",
      ["S"] = "split_with_window_picker",
      ["s"] = "vsplit_with_window_picker",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true,
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(_) vim.opt_local.signcolumn = "auto" end,
    },
  },
})
