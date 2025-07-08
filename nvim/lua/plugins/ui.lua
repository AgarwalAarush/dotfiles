return {
  -- file management & picker
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  -- colorscheme
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   dependencies = "nvim-web-devicons",
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha",
  --     transparent_background = false,
  --     integrations = {
  --       aerial = true,
  --       alpha = true,
  --       cmp = true,
  --       gitsigns = true,
  --       illuminate = true,
  --       indent_blankline = { enabled = true },
  --       mason = true,
  --       native_lsp = {
  --         enabled = true,
  --         virtual_text = {
  --           errors = { "italic" },
  --           hints = { "italic" },
  --           warnings = { "italic" },
  --           information = { "italic" },
  --         },
  --         underlines = {
  --           errors = { "underline" },
  --           hints = { "underline" },
  --           warnings = { "underline" },
  --           information = { "underline" },
  --         },
  --       },
  --       notify = true,
  --       neotree = true,
  --       treesitter = true,
  --       which_key = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd([[colorscheme catppuccin]])
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "auto",
  --       dark_variant = "main",
  --       styles = {
  --         transparency = true,
  --       }
  --     })
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      -- Custom theme matching your colorscheme
      local custom_theme = {
        normal = {
          a = { fg = "#141414", bg = "#AF9FFF", gui = "bold" },
          b = { fg = "#d8dee9", bg = "#1A1A1A" },
          c = { fg = "#b3b3b3", bg = "#141414" },
        },
        insert = {
          a = { fg = "#141414", bg = "#98c379", gui = "bold" },
          b = { fg = "#d8dee9", bg = "#1A1A1A" },
          c = { fg = "#b3b3b3", bg = "#141414" },
        },
        visual = {
          a = { fg = "#141414", bg = "#e5c07b", gui = "bold" },
          b = { fg = "#d8dee9", bg = "#1A1A1A" },
          c = { fg = "#b3b3b3", bg = "#141414" },
        },
        replace = {
          a = { fg = "#141414", bg = "#e06c75", gui = "bold" },
          b = { fg = "#d8dee9", bg = "#1A1A1A" },
          c = { fg = "#b3b3b3", bg = "#141414" },
        },
        command = {
          a = { fg = "#141414", bg = "#AF9FFF", gui = "bold" },
          b = { fg = "#d8dee9", bg = "#1A1A1A" },
          c = { fg = "#b3b3b3", bg = "#141414" },
        },
        inactive = {
          a = { fg = "#5c6370", bg = "#141414" },
          b = { fg = "#5c6370", bg = "#141414" },
          c = { fg = "#5c6370", bg = "#141414" },
        },
      }

      return {
        options = {
          theme = custom_theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "aerial", "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
  -- Noice Config
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        presets = {
          long_message_to_split = true,
          lsp_doc_border = true,
        },
      })
    end,
  },
  {
    'stevearc/aerial.nvim',
    opts = function()
      return require "configs.aerial"
    end,
    config = function(_, opts)
      require("aerial").setup(opts)
    end,
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end
  },
}
