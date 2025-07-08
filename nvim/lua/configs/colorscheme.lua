-- Manual dual colorschemes: dark and light themes
-- Terminal color investigation: Force true colors and specific background

local api = vim.api
local g = vim.g

-- Force true color support
vim.o.termguicolors = true

local dark_theme = {
  Normal       = { fg = "#d8dee9", bg = "#141414" },
  Comment      = { fg = "#5c6370", italic = true },
  Constant     = { fg = "#b3b3b3" },
  String       = { fg = "#98c379" },
  Identifier   = { fg = "#e06c75" },
  Function     = { fg = "#AF9FFF" },
  Statement    = { fg = "#AF9FFF" },
  Keyword      = { fg = "#AF9FFF" },
  Type         = { fg = "#e5c07b" },
  Number       = { fg = "#b3b3b3" },
  Operator     = { fg = "#b3b3b3" },
  PreProc      = { fg = "#AF9FFF" },
  Special      = { fg = "#AF9FFF" },
  Underlined   = { fg = "#b3b3b3", underline = true },
  Visual       = { bg = "#1A1A1A" },
  LineNr       = { fg = "#3b3b3b", bg = "#141414" },
  CursorLineNr = { fg = "#e5c07b", bg = "#141414", bold = true },
  VertSplit    = { fg = "#1A1A1A" },
  StatusLine   = { fg = "#b3b3b3", bg = "#1A1A1A" },
  Pmenu        = { fg = "#b3b3b3", bg = "#1A1A1A" },
  PmenuSel     = { fg = "#141414", bg = "#b3b3b3" },
  Search       = { fg = "#141414", bg = "#e5c07b" },
  IncSearch    = { fg = "#141414", bg = "#e06c75" },
  VisualNOS    = { bg = "#1A1A1A" },
  Directory    = { fg = "#b3b3b3" },
  Error        = { fg = "#e06c75", bg = "#141414", bold = true },
  Todo         = { fg = "#e5c07b", bg = "#141414", bold = true },
  -- Additional background-related highlight groups
  SignColumn   = { bg = "#141414" },
  FoldColumn   = { bg = "#141414" },
  Folded       = { bg = "#141414" },
  NonText      = { fg = "#3b3b3b", bg = "#141414" },
  EndOfBuffer  = { fg = "#141414", bg = "#141414" },
  -- Window and buffer background
  NormalNC     = { fg = "#d8dee9", bg = "#141414" },
  WinSeparator = { fg = "#1A1A1A", bg = "#141414" },
  -- Status and tab line backgrounds
  StatusLineNC = { fg = "#5c6370", bg = "#141414" },
  TabLine      = { fg = "#5c6370", bg = "#141414" },
  TabLineFill  = { bg = "#141414" },
  TabLineSel   = { fg = "#d8dee9", bg = "#1A1A1A" },
  -- Floating window backgrounds
  NormalFloat  = { fg = "#d8dee9", bg = "#141414" },
  FloatBorder  = { fg = "#1A1A1A", bg = "#141414" },
  -- NvimTree colors
  NvimTreeNormal = { fg = "#d8dee9", bg = "#141414" },
  NvimTreeNormalNC = { fg = "#d8dee9", bg = "#141414" },
  NvimTreeRootFolder = { fg = "#AF9FFF", bold = true },
  NvimTreeFolderName = { fg = "#98c379" },
  NvimTreeFolderIcon = { fg = "#98c379" },
  NvimTreeEmptyFolderName = { fg = "#5c6370" },
  NvimTreeOpenedFolderName = { fg = "#98c379", bold = true },
  NvimTreeSymlink = { fg = "#AF9FFF" },
  NvimTreeExecFile = { fg = "#AF9FFF" },
  NvimTreeSpecialFile = { fg = "#e5c07b" },
  NvimTreeImageFile = { fg = "#e06c75" },
  NvimTreeIndentMarker = { fg = "#3b3b3b" },
  NvimTreeGitDirty = { fg = "#e5c07b" },
  NvimTreeGitStaged = { fg = "#98c379" },
  NvimTreeGitMerge = { fg = "#e06c75" },
  NvimTreeGitRenamed = { fg = "#AF9FFF" },
  NvimTreeGitNew = { fg = "#98c379" },
  NvimTreeGitDeleted = { fg = "#e06c75" },
  NvimTreeGitIgnored = { fg = "#5c6370" },
  NvimTreeWindowPicker = { fg = "#141414", bg = "#e5c07b", bold = true },
}

local light_theme = {
  Normal       = { fg = "#24292f", bg = "#ffffff" },
  Comment      = { fg = "#6a737d", italic = true },
  Constant     = { fg = "#005cc5" },
  String       = { fg = "#22863a" },
  Identifier   = { fg = "#e36209" },
  Function     = { fg = "#6f42c1" },
  Statement    = { fg = "#d73a49" },
  Keyword      = { fg = "#d73a49" },
  Type         = { fg = "#005cc5" },
  Number       = { fg = "#005cc5" },
  Operator     = { fg = "#24292f" },
  PreProc      = { fg = "#6f42c1" },
  Special      = { fg = "#6f42c1" },
  Underlined   = { fg = "#6f42c1", underline = true },
  Visual       = { bg = "#e1e4e8" },
  LineNr       = { fg = "#d1d5da", bg = "#ffffff" },
  CursorLineNr = { fg = "#6f42c1", bg = "#ffffff", bold = true },
  VertSplit    = { fg = "#e1e4e8" },
  StatusLine   = { fg = "#586069", bg = "#e1e4e8" },
  Pmenu        = { fg = "#586069", bg = "#e1e4e8" },
  PmenuSel     = { fg = "#ffffff", bg = "#0366d6" },
  Search       = { fg = "#ffffff", bg = "#ffea7f" },
  IncSearch    = { fg = "#ffffff", bg = "#d73a49" },
  VisualNOS    = { bg = "#e1e4e8" },
  Directory    = { fg = "#0366d6" },
  Error        = { fg = "#d73a49", bg = "#ffffff", bold = true },
  Todo         = { fg = "#e36209", bg = "#ffffff", bold = true },
}

local current_theme = "dark"

local function apply_theme(theme)
  for group, opts in pairs(theme) do
    api.nvim_set_hl(0, group, opts)
  end
end

function _G.ToggleTheme()
  if current_theme == "dark" then
    apply_theme(light_theme)
    current_theme = "light"
    vim.o.background = "light"
  else
    apply_theme(dark_theme)
    current_theme = "dark"
    vim.o.background = "dark"
  end
end

-- Set dark theme by default
apply_theme(dark_theme)
vim.o.background = "dark"

-- Force Normal background to be consistent
vim.api.nvim_set_hl(0, "Normal", { fg = "#d8dee9", bg = "#141414" })
vim.api.nvim_set_hl(0, "NormalNC", { fg = "#d8dee9", bg = "#141414" })

-- Keybinding: <leader>ut to toggle theme
vim.keymap.set("n", "<leader>ut", "<cmd>lua ToggleTheme()<CR>", { desc = "Toggle light/dark theme" })

-- Debug function to check what terminal is actually displaying
function _G.CheckTerminalColors()
  print("termguicolors:", vim.o.termguicolors)
  print("Background setting:", vim.o.background)
  print("Current Normal highlight:", vim.api.nvim_get_hl(0, { name = "Normal" }))
end

-- Add keybinding to check colors
vim.keymap.set("n", "<leader>cc", "<cmd>lua CheckTerminalColors()<CR>", { desc = "Check terminal colors" })