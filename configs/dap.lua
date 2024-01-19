local ok, dap = pcall(require, "dap")

if not ok then
  return
end

local M = {}
M.setup = function()
  vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  })
  vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  })

  -- dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
  -- dap.set_log_level('TRACE')
  -- require("dap.ext.vscode").load_launchjs()
  dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "./${relativeFileDirname}",
    },
    -- works with go.mod packages and sub packages
    {
      type = "delve",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  }

  -- Dart / Flutter
  dap.adapters.dart = {
    type = "executable",
    command = "dart",
    args = { "debug_adapter" },
  }
  dap.adapters.flutter = {
    type = "executable",
    command = "flutter",
    args = { "debug_adapter" },
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch dart",
      dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
      flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
      program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
      cwd = "${workspaceFolder}",
    },
    {
      type = "flutter",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
      flutterSdkPath = "/opt/flutter/bin/flutter", -- ensure this is correct
      program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
      cwd = "${workspaceFolder}",
    },
  }
end
return M
