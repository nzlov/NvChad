---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>uu"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<C-c>"] = "",

    -- lsp
    ["gD"] = "",
    ["gd"] = "",
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ca"] = "",
    ["<leader>ra"] = "",
    ["gr"] = "",
    ["<leader>f"] = "",
    ["d]"] = "",
    ["<leader>q"] = "",
    ["<leader>fm"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",

    -- nvimtree
    ["<C-n>"] = "",
    ["<leader>e"] = "",

    -- telescope
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>tk"] = "",

    ["<leader>cm"] = "",
    ["<leader>gt"] = "",

    ["<leader>pt"] = "",

    ["<leader>th"] = "",

    -- nvterm
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- whichkey
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    -- gitsign
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
  },
}

return M
