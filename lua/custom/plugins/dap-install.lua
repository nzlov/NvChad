local ok, dai = pcall(require, "dap-install")

if not ok then
   return
end

local M = {}
M.setup = function(on_attach)
        dai.setup({
        	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
        })
        local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

        for _, debugger in ipairs(dbg_list) do
        	dai.config(debugger)
        end
end

return M
