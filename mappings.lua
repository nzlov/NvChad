---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>uu"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",

    -- lsp
    ["gD"] = "",
    ["gd"] = "",
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ca"] = "",
    ["<leader>ra"] = "",
    ["gr"] = "",
    ["<leader>lf"] = "",
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
    ["<leader>cc"] = "",
  },
}

M.general = {
  n = {
    ["<C-c>"] = { "<ESC>", "" },
    ["<C-g>p"] = { "<cmd>lua require('gpt').prompt() <CR>", "GPT Prompt" },
    ["<C-g>c"] = { "<cmd>lua require('gpt').cancel() <CR>", "GPT Cancel" },
  },
  i = {
    ["<C-c>"] = { "<ESC>", "" },
    ["<C-g>p"] = { "<cmd>lua require('gpt').prompt() <CR>", "GPT Prompt" },
  },
  v = {
    ["<C-c>"] = { "<ESC>", "" },
    ["<C-g>p"] = { "<cmd>lua require('gpt').visual_prompt() <CR>", "GPT Prompt" },
    ["<C-g>r"] = { "<cmd>lua require('gpt').replace() <CR>", "GPT Rewrite" },
  },
}

return M
