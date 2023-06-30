local cmp = require "cmp"
local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "go",
    "gomod",
    "gowork",
    "json",
    "graphql",
    "yaml",
    "c",
    "markdown",
    "markdown_inline",
    "java",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    "json-lsp",
    "yaml-language-server",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettierd",

    "graphql-language-service-cli",
    "gopls",
    "goimports",
    "golangci-lint",
    "delve",
    "golines",
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
      },
    },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = "cmp_tabby", group_index = 2 },
    { name = "cmp_tabnine", group_index = 2 },
    { name = "codeium", group_index = 2 },
    { name = "cmp_fauxpilot", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
  mapping = {
    ["<C-o>"] = cmp.mapping.complete(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require "cmp_tabnine.compare",
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

M.indentblankline = {
  show_current_context_start = false,
}
return M
