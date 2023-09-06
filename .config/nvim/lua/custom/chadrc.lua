---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = true,


  statusline = {
    theme = "minimal"
  },

-- Override theme color to be more visible
  changed_themes = {
    gruvbox = {
      base_30 = {
        grey_fg = "#777777"
      }
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
