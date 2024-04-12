return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'lewis6991/gitsigns.nvim'
  },
  config = function()
    require('scrollbar').setup()
    require('scrollbar.handlers.gitsigns').setup()
  end
}
