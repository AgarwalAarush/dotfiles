local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end, 0)
    end
  end,
})

-- local function set_textwidth_by_filename()
--   local filename = vim.fn.expand("%:t")  -- Get the current file name
--   vim.api.nvim_echo({ { "Setting textwidth for " .. filename, "Comment" } }, false, {})
--   if filename:match("%.txt$") then
--     vim.opt_local.textwidth = 120  -- Set textwidth for .txt files
--   else
--     vim.opt_local.textwidth = 178  -- Set textwidth for all other files
--   end
-- end
--
-- local function set_bullet_point_formatting()
--   -- Set format options to include 'c' (comments), 'r' (continue comments), 'n' (recognize lists), and 'w' (trailing whitespace continues paragraphs)
--   vim.opt_local.formatoptions = vim.opt_local.formatoptions + 'c' + 'r' + 'n' + 'w'
--   -- Define comment strings for bullet points
--   vim.opt_local.comments = "b:-,b:*,b:+"
-- end
--
-- local function width_and_formatting()
--   set_textwidth_by_filename()
--   set_bullet_point_formatting()
-- end
--
-- -- Create an autocmd for the BufRead event
-- autocmd("BufEnter", {
--   pattern = "*",
--   callback = width_and_formatting(),
-- })
