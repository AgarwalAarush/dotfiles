local map = vim.keymap.set
local api = vim.api
local cur_buf = api.nvim_get_current_buf
local set_buf = api.nvim_set_current_buf

local function buf_index(bufnr)
  for i, value in ipairs(vim.t.bufs) do
    if value == bufnr then
      return i
    end
  end
end

vim.g.mapleader = " "
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- movements
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })


-- buffer navigation
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "previous buffer" })

-- line numbers
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- formatting
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format files" })

-- comment
map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "Search in current buffer" })

local function toggle_aerial_focus()
  -- Check if the aerial window is open.
  if require("aerial").is_open() then
    -- If the current window is aerial, switch to the previous window.
    if vim.bo.filetype == 'aerial' then
      vim.cmd("wincmd p")
    else
      -- Otherwise, focus the aerial window.
      require("aerial").focus()
    end
  else
    -- If the aerial window is not open, toggle it open.
    require("aerial").toggle()
  end
end

map("n", "<leader>aa", toggle_aerial_focus, { desc = "Toggle aerial focus" })

-- Focus/unfocus aerial without toggling visibility
local function focus_aerial()
  local aerial = require("aerial")
  if aerial.is_open() then
    if vim.bo.filetype == "aerial" then
      vim.cmd("wincmd p")
    else
      aerial.focus()
    end
  else
    -- If not open, open aerial and focus it
    aerial.open()
  end
end

map("n", "<leader>af", focus_aerial, { desc = "Focus/unfocus aerial" })

-- save file
map("n", "<leader>w", ":w<CR>", { noremap = true, desc = "write current buffer changes" })

-- windows
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- nvim tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "nvimtree toggle window on current file" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "collapse nvimtree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>ee", "<cmd>NvimTreeExpandAll<CR>", { desc = "nvimtree expand all" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- Terminal
map("n", "<leader>h", function()
  require("configs.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("configs.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("configs.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("configs.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("configs.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- clear highlights
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- toggle search highlighting
map("n", "<leader>hl", "<cmd>set hlsearch!<CR>", { desc = "Toggle search highlighting" })

-- dap
map("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
map("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
map("n", "<leader>do", ":lua require('dapui').open({ reset = true })<CR>", { noremap = true })
map("n", "<leader>dl", ":lua require('dapui').close({ reset = true })<CR>", { noremap = true })
map("n", "<leader>de", ":DapTerminate<CR>", { noremap = true })

-- map("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
--
map("n", "<leader>q", ":q<CR>", { noremap = true })

-- git
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
