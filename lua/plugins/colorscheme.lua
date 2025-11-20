return {
  -- Tema Utama (Everforest Default)
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 2,
        italics = true,
        disable_italic_comments = false,
      })
      vim.cmd.colorscheme("onedark")
    end,
  },

  -- TokyoNight (italic style)
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon", -- night, storm, day, moon
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
          variables = {},
        },
      })
    end,
  },

  -- Catppuccin (Lengkap + Italic)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "italic" },
          keywords = { "italic" },
          strings = {},
          variables = {},
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          telescope = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        italic = true,
        contrast = "hard",
        transparent_mode = true,
      })
    end,
  },

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },

  -- Onedark
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker", -- dark, darker, cool, warm, deep
        transparent = true,
        code_style = {
          comments = "italic",
          keywords = "italic",
          functions = "italic",
          strings = "none",
          variables = "none",
        },
      })
    end,
  },

  -- Everblush
  {
    "Everblush/everblush.nvim",
    name = "everblush",
    priority = 1000,
    config = function()
      require("everblush").setup({
        transparent_background = true,
        italic = true,
      })
    end,
  },

  -- VSCode Dark Modern
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = true,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        color_overrides = {},
        group_overrides = {
          Comment = { italic = true },
          Keyword = { italic = true },
          Conditional = { italic = true },
          Repeat = { italic = true },
          Function = { italic = true },
          Identifier = { italic = true },
          Type = { italic = true },
          Statement = { italic = true },
        },
      })
      -- vim.cmd.colorscheme("vscode") -- aktifkan kalau mau VSCode default
    end,
  },
}
