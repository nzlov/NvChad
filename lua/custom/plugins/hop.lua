local ok, hop = pcall(require, "hop")

if not ok then
   return
end

local M = {}
M.setup = function(on_attach)
   hop.setup()
   vim.api.nvim_set_keymap("n", "s", ":HopChar1<cr>", { silent = true })
   vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
end

return M
