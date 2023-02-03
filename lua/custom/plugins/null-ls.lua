local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.code_actions.gomodifytags,
  b.formatting.goimports,
  b.formatting.golines.with { args = { "-m", "80" } },

  b.diagnostics.golangci_lint,
  -- b.diagnostics.staticcheck,

  b.formatting.stylua,

  b.formatting.prettierd,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format {
            filter = function(client)
              -- apply whatever logic you want (in this example, we'll only use null-ls)
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
  -- format on save
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --     vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
  --   end
  -- end,
}
