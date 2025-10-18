return {
  -- Tema Utama
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- TokyoNight
  { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000 },

  -- Catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Gruvbox
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },

  -- Rose Pine
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },

  -- Onedark
  { "navarasu/onedark.nvim", name = "onedark", priority = 1000 },

  --Everforest
  { "neanias/everforest-nvim", name = "everforet", priority = 1000 },

  --Everblush
  { "Everblush/everblush.nvim", name = "everblush", priority = 1000 },
}
