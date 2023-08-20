local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup {
        top_down = false,
      }
      vim.notify = require "notify"
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    cmd = { "AerialToggle" },
    config = function()
      require("aerial").setup {}
    end,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "nzlov/nvim-lsp-notify",
        config = function()
          require("lsp-notify").setup {
            -- notify = require "notify",
            excludes = { "null-ls" },
          }
        end,
        dependencies = {},
      },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {

      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {
            max_lines = 1000,
            max_num_results = 20,
            sort = true,
            run_on_every_keystroke = true,
            snippet_placeholder = "..",
            show_prediction_strength = true,
          }
        end,
      },
      -- {
      --   "jcdickinson/codeium.nvim",
      --   config = function()
      --     require("codeium").setup {}
      --   end,
      -- },
      -- {
      --   "nzlov/cmp-fauxpilot",
      --   config = function()
      --     require("cmp_fauxpilot.config"):setup {
      --       host = "http://192.168.1.109:5000",
      --       n = 2,
      --     }
      --   end,
      -- },
      -- {
      --   "nzlov/cmp-tabby",
      --   config = function()
      --     require("cmp_tabby.config"):setup {
      --       host = "http://192.168.1.109:5000",
      --     }
      --   end,
      -- },
    },
  },

  {
    "folke/which-key.nvim",
    enabled = true,
    event = "VimEnter",
    keys = {},
    config = function()
      require "custom.configs.whichkey"
    end,
  },
  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.indentblankline,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("telescope").load_extension "ui-select"
        end,
      },
    },
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {}
    end,
    event = "BufWinEnter",
  },
  {
    "phaazon/hop.nvim",
    cmd = { "HopChar1", "HopWord" },
    config = function()
      require("hop").setup()
    end,
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("custom.configs.dap").setup()
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("custom.configs.dapui").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("custom.configs.dapvirtualtext").setup()
        end,
      },
    },
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  { "mg979/vim-visual-multi" },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = true,
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      require "custom.ftplugin.java"
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
  },
  {
    "akinsho/toggleterm.nvim",
    config = true,
  },
}

return plugins
