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

      -- Wait until oil has opened, for a maximum of 1 second.
      vim.wait(1000, function()
        return oil.get_cursor_entry() ~= nil
      end)
      if oil.get_cursor_entry() then
        oil.open_preview()
      end
    end)
  end
}
