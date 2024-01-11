-- vim.cmd [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * :lua vim.lsp.buf.format()
-- augroup END
-- ]]

vim.api.nvim_create_augroup("LspAttach_Group", {})
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group="LspAttach_Group",
--   pattern = "*.go",
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     -- buf_request_sync defaults to a 1000ms timeout. Depending on your
--     -- machine and codebase, you may want longer. Add an additional
--     -- argument after params if you find that you have to write the file
--     -- twice for changes to be saved.
--     -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--     for cid, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--           vim.lsp.util.apply_workspace_edit(r.edit, enc)
--         end
--       end
--     end
--     vim.lsp.buf.format({async = false})
--   end,
-- })

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_Group",
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- if client.server_capabilities.completionProvider then
    --   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- end
    -- if client.server_capabilities.definitionProvider then
    --   vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    -- end
    -- Enable inlay hints if the client supports it.
    if client.supports_method "textDocument/inlayHint" then
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(bufnr, true)
      end
    end
  end,
})

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "pylsp",
  "jsonls",
  "graphql",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      usePlaceholders = true,
    },
  }
end

lspconfig.volar.setup {
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "json",
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  init_options = {
    usePlaceholders = true,
  },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = false,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = false,
        parameterNames = true,
        rangeVariableTypes = false,
      },
    },
  },
}
