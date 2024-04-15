local M = {}
M.setup = function()
  local config = {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      max_height = 0.9,
      max_width = 0.9,
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = "",
    },
    layouts = {
      {
        elements = {
          {
            id = "repl",
            size = 0.05,
          },
          {
            id = "scopes",
            size = 0.25,
          },
          {
            id = "breakpoints",
            size = 0.25,
          },
          {
            id = "stacks",
            size = 0.25,
          },
          {
            id = "watches",
            size = 0.20,
          },
        },
        position = "left",
        size = 30,
      },
      {
        elements = {
          {
            id = "console",
            size = 1.0,
          },
        },
        position = "bottom",
        size = 30,
      },
    },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t",
    },
    render = {
      indent = 1,
      max_value_lines = 100,
    },
  }
  local dap, dapui = require "dap", require "dapui"
  dapui.setup(config)

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.float_element(
      "console",
      { position = "center", height = math.floor(vim.o.lines * 0.9), width = math.floor(vim.o.columns * 0.8) }
    )
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end
return M
