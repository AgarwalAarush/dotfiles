local M = {
  -- Priority of backends affects which one is used when multiple are available.
  -- A higher number means higher priority.
  backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },

  -- The 'auto' layout will create a popup window for aerial.
  layout = {
    preset = "auto",
    width = 0.9,
    height = 0.8,
  },

  -- Keymaps for aerial operations.
  keymaps = {
    ["?"] = "actions.show_help",
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.jump",
    ["<C-v>"] = "actions.jump_vsplit",
    ["<C-s>"] = "actions.jump_split",
    ["p"] = "actions.prev_up",
    ["n"] = "actions.next_up",
  },
}

return M
