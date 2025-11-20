local lspconfig = require("lspconfig")

-- Setup CSS LSP
lspconfig.cssls.setup({
  root_dir = lspconfig.util.root_pattern("index.html", ".git", "package.json"),

  init_options = {
    provideFormatter = true,
    lint = true,
    workspaceFolders = { "~/bootstrap/node_modules/bootstrap/dist/css" },
  },
})

require("lspconfig").cssls.setup({
  filetypes = { "html", "css", "scss", "less" },
})
