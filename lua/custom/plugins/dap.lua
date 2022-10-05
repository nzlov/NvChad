local ok, dap = pcall(require, "dap")

if not ok then
   return
end

local M = {}
M.setup = function()

  vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
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

  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
  -- dap.set_log_level('TRACE')
  end
return M
