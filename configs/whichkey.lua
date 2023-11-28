local wk = require "which-key"

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
}

function _lazygit_toggle()
  lazygit:toggle()
end

function _float_console()
  require("dapui").float_element(
    "console",
    { position = "center", height = math.floor(vim.o.lines * 0.9), width = math.floor(vim.o.columns * 0.8) }
  )
end

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
  ["[d"] = {
    function()
      vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    "Goto prev",
  },
  ["]d"] = {
    function()
      vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    "Goto next",
  },
  ["gd"] = { "<cmd> Telescope lsp_definitions<cr>", "LSP Definition" },
  ["gr"] = { "<cmd> Telescope lsp_references<cr>", "LSP References" },
  ["gi"] = { "<cmd> Telescope lsp_implementations<cr>", "LSP Implementations" },
  ["K"] = { "<cmd> lua vim.lsp.buf.hover()<cr>", "LSP Hover" },
}
wk.register {
  ["<leader>"] = {
    L = { "<cmd>Lazy<CR>", "Lazy" },
    a = { "<cmd> %y+ <CR>", "Copy whole file" },
    o = { "<cmd>AerialToggle!<CR>", "AerialToggle" },
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
      Q = { "<cmd>lua require'dap'.terminate()<cr>", "Quit" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      r = { "<cmd>lua require'dap'.repl.toggle({height=1})<cr>", "Toggle Repl" },
      R = { "<cmd>lua require'dap'.restart()<cr>", "Restart" },
      g = { "<cmd>lua require'dapui'.toggle()<cr>", "UI Toggle" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval" },
      l = { "<cmd>lua _float_console()<cr>", "Float Console" },
    },
    g = {
      name = "Git",
      g = { "<cmd>lua _lazygit_toggle()<cr>", "Git" },
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
      d = { "<cmd> Telescope diagnostics bufnr=0 theme=dropdown<cr>", "Document Diagnostics" },
      D = { "<cmd> Telescope diagnostics <cr>", "Workspace Diagnostics" },
      s = { "<cmd> Telescope lsp_document_symbols symbol_width=0.9<cr>", "Document Symbols" },
      S = { "<cmd> Telescope lsp_dynamic_workspace_symbols symbol_width=0.9<cr>", "Workspace Symbols" },
      f = { "<cmd>lua vim.lsp.buf.format() <cr>", "Format" },
      i = {},
      I = { "<cmd>LspInfo<cr>", "Info" },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua require 'nvchad.renamer'.open()<cr>", "Rename" },

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
      s = { "<cmd>Telescope live_grep<cr>", "Text" },
      t = { "<cmd>Telescope themes enable_preview=true<cr>", "Theme" },
      h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      w = { "<cmd>Telescope grep_string<cr>", "Grep String" },
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
    c = {
      name = "ChatGPT",
      c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      e = { "<cmd>ChatGPTEditWithInstruction<CR>", "编辑并添加说明", mode = { "n", "v" } },
      g = { "<cmd>ChatGPTRun grammar_correction<CR>", "语法纠正", mode = { "n", "v" } },
      t = { "<cmd>ChatGPTRun translate<CR>", "翻译", mode = { "n", "v" } },
      k = { "<cmd>ChatGPTRun keywords<CR>", "提取关键词", mode = { "n", "v" } },
      d = { "<cmd>ChatGPTRun docstring<CR>", "文档", mode = { "n", "v" } },
      a = { "<cmd>ChatGPTRun add_tests<CR>", "添加测试", mode = { "n", "v" } },
      o = { "<cmd>ChatGPTRun optimize_code<CR>", "优化代码", mode = { "n", "v" } },
      s = { "<cmd>ChatGPTRun summarize<CR>", "总结", mode = { "n", "v" } },
      f = { "<cmd>ChatGPTRun fix_bugs<CR>", "修复Bug", mode = { "n", "v" } },
      x = { "<cmd>ChatGPTRun explain_code<CR>", "解释代码", mode = { "n", "v" } },
      r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      l = {
        "<cmd>ChatGPTRun code_readability_analysis lang=中文 <CR>",
        "Code Readability Analysis",
        mode = { "n", "v" },
      },
    },
  },
}
