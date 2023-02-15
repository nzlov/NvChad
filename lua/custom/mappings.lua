return {
  general = {
    n = {
      -- save
      ["<leader>w"] = { "<cmd> w <CR>", "save file" },
      ["<leader>q"] = { "<cmd> q! <CR>", "exit" },
      ["<leader>uu"] = { "", "" },
    },
  },
  packer = {
    n = {
      ["<leader>p"] = { "", "Packer" },
      ["<leader>pc"] = { "<cmd>PackerCompile<cr>", "Compile" },
      ["<leader>pi"] = { "<cmd>PackerInstall<cr>", "Install" },
      ["<leader>pr"] = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
      ["<leader>pS"] = { "<cmd>PackerSync<cr>", "Sync" },
      ["<leader>ps"] = { "<cmd>PackerStatus<cr>", "Status" },
      ["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  },
  telescope = {
    n = {
      ["<leader>s"] = { "", "Telescope" },
      -- find
      ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "find files" },
      ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
      ["<leader>sw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
      ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
      ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
      ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
      ["<leader>sk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
      ["<leader>sm"] = { "<cmd> Telescope marks <CR>", "show marks" },
      ["<leader>sc"] = { "<cmd> Telescope commands <CR>", "show commands" },
      -- git
      ["<leader>sg"] = { "", "Gits" },
      ["<leader>sgc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
      ["<leader>sgt"] = { "<cmd> Telescope git_status <CR>", "git status" },
      ["<leader>st"] = { "", "Themes" },
      ["<leader>stm"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
      -- theme ssitcher
      ["<leader>sth"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
    },
  },
  lspconfig = {
    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
      ["<leader>l"] = { "", "LSP" },
      ["gD"] = {
        function()
          vim.lsp.buf.declaration()
        end,
        "lsp declaration",
      },
      ["gd"] = {
        "<cmd> Telescope lsp_definitions<cr>",
        "lsp definition",
      },
      ["gr"] = {
        "<cmd> Telescope lsp_references<cr>",
        "lsp references",
      },
      ["[d"] = {
        function()
          vim.diagnostic.goto_prev()
        end,
        "goto prev",
      },
      ["]d"] = {
        function()
          vim.diagnostic.goto_next()
        end,
        "goto_next",
      },
      ["K"] = {
        function()
          vim.lsp.buf.hover()
        end,
        "lsp hover",
      },
      ["gi"] = {
        function()
          vim.lsp.buf.implementation()
        end,
        "lsp implementation",
      },
      ["<leader>ld"] = {
        "<cmd> Telescope diagnostics bufnr=0<cr>",
        "Document Diagnostics",
      },
      ["<leader>ls"] = {
        "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>",
        "Document Symbols",
      },
      ["<leader>lr"] = {
        function()
          require("nvchad_ui.renamer").open()
        end,
        "lsp rename",
      },
      ["<leader>lR"] = { "<cmd> LspRestart <CR>", "Restart LSP" },
      ["<leader>lc"] = {
        "<cmd> Telescope lsp_code_actions <cr>",
        "Code Action",
      },
      ["<leader>lf"] = {
        function()
          vim.lsp.buf.formatting()
        end,
        "lsp formatting",
      },
      ["<leader>lw"] = { "", "workspaces" },
      ["<leader>lws"] = {
        "<cmd> Telescope lsp_workspace_symbols <CR>",
        "Workspace Symbols",
      },
      ["<leader>lwa"] = {
        function()
          vim.lsp.buf.add_workspace_folder()
        end,
        "add workspace folder",
      },
      ["<leader>lwr"] = {
        function()
          vim.lsp.buf.remove_workspace_folder()
        end,
        "remove workspace folder",
      },
      ["<leader>lwl"] = {
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        "list workspace folders",
      },
      ["<leader>lt"] = { "", "Telescope" },
      ["<leader>ltd"] = {
        "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>",
        "Definition",
      },
      ["<leader>ltt"] = {
        "<cmd>lua require'telescope.builtin'.lsp_type_definitions{}<cr>",
        "Type Definition",
      },
      ["<leader>lti"] = {
        "<cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>",
        "Implementation",
      },
      ["<leader>ltr"] = {
        "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>",
        "References",
      },
    },
  },
  nvimtree = {

    n = {
      -- toggle
      ["<C-n>"] = { "", "" },

      -- focus
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    },
  },
  gitsigns = {
    n = {
      ["<leader>df"] = {
        function()
          require("gitsigns").diffthis()
        end,
        "Diff This",
      },
    },
  },
}
