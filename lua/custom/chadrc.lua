-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme_toggle = { "one_light", "onedark" },
  theme = "one_light",
}

-- NvChad included plugin options & overrides
M.plugins = require "custom.plugins.init"

M.mappings = require "custom.mappings"

return M
