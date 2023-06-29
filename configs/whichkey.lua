local wk = require "which-key"
wk.register {
  ["s"] = {
    "<cmd>HopChar1<cr>",
    "Search Char",
  },
  ["S"] = {
    "<cmd>HopWord<cr>",
    "Search Word",
  },
  ["]g"] = {
    function()
      if vim.wo.diff then
        return "]g"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    "Jump to next hunk",
    opts = { expr = true },
  },
  ["[g"] = {
    function()
      if vim.wo.diff then
        return "[g"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    "Jump to prev hunk",
    opts = { expr = true },
  },
  ["gd"] = { "<cmd> Telescope lsp_definitions<cr>", "lsp definition" },
  ["gr"] = { "<cmd> Telescope lsp_references<cr>", "lsp references" },
  ["gi"] = { "<cmd> Telescope lsp_implementations<cr>", "lsp implementations" },
}
wk.register {
  ["<leader>"] = {
    L = { "<cmd>Lazy<CR>", "Lazy" },
    q = { "<cmd>q!<CR>", "Exit" },
    w = { "<cmd>w<CR>", "Save File" },
    h = { "<cmd>nohlsearch<CR>", "No Highlight" },
    n = { "<cmd>enew <CR>", "New File" },
    u = { "<cmd>UndotreeToggle<CR>", "UndotreeToggle" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    e = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    t = {
      name = "Toggle",
      n = { "<cmd> set nu! <CR>", "toggle line number" },
      r = { "<cmd> set rnu! <CR>", "toggle relative number" },
      t = { "<cmd> lua require('base46').toggle_theme() <CR>", "toggle theme" },
    },
    b = {
      name = "Buffers",
      j = { "<cmd>BufferPick<cr>", "Jump" },
      f = { "<cmd>Telescope buffers<cr>", "Find" },
      b = { "<cmd>b#<cr>", "Previous" },
      w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
      e = {
        "<cmd>BufferCloseAllButCurrent<cr>",
        "Close all but current",
      },
      h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
      l = {
        "<cmd>BufferCloseBuffersRight<cr>",
        "Close all to the right",
      },
      D = {
        "<cmd>BufferOrderByDirectory<cr>",
        "Sort by directory",
      },
      L = {
        "<cmd>BufferOrderByLanguage<cr>",
        "Sort by language",
      },
    },
    d = {
      name = "Debug",
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      G = { "<cmd>lua require('dapui').toggle()<cr>", "UI Toggle" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval" },
    },
    -- p = {
    --   name = "Packer",
    --   c = { "<cmd>PackerCompile<cr>", "Compile" },
    --   i = { "<cmd>PackerInstall<cr>", "Install" },
    --   r = { "<cmd>lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
    --   s = { "<cmd>PackerSync<cr>", "Sync" },
    --   S = { "<cmd>PackerStatus<cr>", "Status" },
    --   u = { "<cmd>PackerUpdate<cr>", "Update" },
    -- },
    g = {
      name = "Git",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
      },
      d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
      },
    },
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd> Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      D = { "<cmd> Telescope diagnostics <cr>", "Workspace Diagnostics" },
      s = { "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>", "Document Symbols" },
      S = { "<cmd> Telescope lsp_workspace_symbols symbol_width=0.9<cr>", "Workspace Symbols" },
      f = { "<cmd>lua vim.lsp.buf.format() <cr>", "Format" },
      i = {},
      I = { "<cmd>LspInfo<cr>", "Info" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua require 'nvchad_ui.renamer'.open()<cr>", "Rename" },

      R = { "<cmd>LspRestart<cr>", "Restart" },
      w = {
        name = "Workspace",
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Wrokspace Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Wrokspace Folder" },
      },
    },
    s = {
      name = "Search",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      w = { "<cmd>Telescope live_grep<cr>", "Text" },
      t = { "<cmd>Telescope colorscheme enable_preview=true<cr>", "Colorscheme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      s = { "<cmd>Telescope grep_string<cr>", "Grep String" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      m = { "<cmd>Telescope marks<cr>", "Bookmarks" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    T = {
      name = "Treesitter",
      i = { ":TSConfigInfo<cr>", "Info" },
    },
  },
}
