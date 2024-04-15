local cmp = require "cmp"
local M = {}

M.treesitter = {
  ensure_installed = {
    "c",
    "css",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "proto",
    "vim",
    "yaml",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "typescript-language-server",

    -- graphql
    "graphql-language-service-cli",

    -- go
    "delve",
    "gopls",
    "goimports",
    "golangci-lint",
    "golines",

    --java
    "jdtls",

    -- other
    "yaml-language-server",
    "protolint",
  },
  registries = {
    "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry",
  },
}

M.telescope = {
  defaults = {
    selection_caret = " ",
    layout_config = {
      preview_cutoff = 0,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {},
    },
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
  view = {
    width = "35%",
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
      -- require "cmp_tabby.compare",
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
