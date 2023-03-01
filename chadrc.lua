---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "one_light",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,

  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
