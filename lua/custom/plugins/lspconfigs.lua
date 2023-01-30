local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- lspservers with default config

local servers = { "html", "cssls", "jsonls", "volar", "tsserver", "graphql", "jdtls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    -- root_dir = vim.loop.cwd,
    init_options = {
      usePlaceholders = true,
    },
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  },
}
