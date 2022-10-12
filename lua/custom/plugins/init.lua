return {
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
  ["kyazdani42/nvim-tree.lua"] = {
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
      require "plugins.configs.lspconfig"
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
  ["Pocco81/DAPInstall.nvim"] = {
    commit = "24923c3819a450a772bb8f675926d530e829665f",
    -- event = "BufWinEnter",
    -- event = "BufRead",
    config = function()
      require("custom.plugins.dap-install").setup()
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("dapui").setup()
    end,
    ft = { "go" },
    requires = { "mfussenegger/nvim-dap" },
  },
  ["mbbill/undotree"] = {},
  ["mg979/vim-visual-multi"] = {},

  ["folke/which-key.nvim"] = { disable = false },
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
