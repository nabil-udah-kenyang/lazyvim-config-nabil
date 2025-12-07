return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    config = function()
      -- shortcut untuk trigger Copilot suggestion
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end,
  },
}
