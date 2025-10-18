return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    -- Load bawaan friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load snippet JSON buatan kamu
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
  end,
}
