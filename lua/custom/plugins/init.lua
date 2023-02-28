return {
  ["folke/which-key.nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.which-key"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "json-lsp",
        "yaml-language-server",

        "html-lsp",
        "vue-language-server",
        "prettierd",

        "graphql-language-service-cli",

        "gopls",
        "goimports",
        "golangci-lint",
      },
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "go",
        "gomod",
        "gowork",
        "json",
        "graphql",
        "yaml",
      },
    },
  },
  ["NvChad/nvterm"] = {
    override_options = {
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
    },
  },
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = {
      git = {
        enable = true,
      },
    },
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = {
      show_current_context_start = false,
    },
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "custom.plugins.lspconfigs"
    end,
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require "custom.plugins.cmp"
    end,
  },
  ["zbirenbaum/copilot.lua"] = {
    disable = true,
    event = "VimEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    disable = true,
    module = { "copilot_cmp" },
    requires = "hrsh7th/nvim-cmp",
    after = "nvim-cmp", -- Here
  },
  ["tzachar/cmp-tabnine"] = {
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    after = "nvim-cmp", -- Here
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
  ["jose-elias-alvarez/null-ls.nvim"] = {
    -- disable = true,
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["ethanholz/nvim-lastplace"] = {

    config = function()
      require("nvim-lastplace").setup {}
    end,
    event = "BufWinEnter",
  },
  ["phaazon/hop.nvim"] = {

    event = "BufRead",
    config = function()
      require("custom.plugins.hop").setup()
    end,
  },
  -- Debugging
  ["mfussenegger/nvim-dap"] = {

    -- event = "BufWinEnter",
    config = function()
      require("custom.plugins.dap").setup()
    end,
  },

  -- Debugger management
  ["Pocco81/dap-buddy.nvim"] = {},
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
  ["mbbill/undotree"] = {},
  ["mg979/vim-visual-multi"] = {},
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  ["akinsho/flutter-tools.nvim"] = {
    ft = { "dart" },
    config = function()
      require("flutter-tools").setup {
        debugger = {
          enabled = true,
        },
      }
    end,
  },
}
