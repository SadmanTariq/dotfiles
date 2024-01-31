return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    { 'AndreM222/copilot-lualine' }
  },
  init = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true
      }
    })
  end,
}
