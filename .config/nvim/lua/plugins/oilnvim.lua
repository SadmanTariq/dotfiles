return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "icon",
        "size",
      },
      view_options = {
        show_hidden = true
      }
    })

    -- HACK: Open preview window after opening oil.
    --       https://github.com/stevearc/oil.nvim/issues/339
    vim.keymap.set('n', '-', function()
      oil.open()

      vim.defer_fn(function()
        oil.select({ preview = true })
      end, 50)
    end)
  end
}
