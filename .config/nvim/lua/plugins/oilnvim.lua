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
    local open_with_preview = function()
      vim.cmd("Oil")
      local timeout = 100

      -- HACK: Wait for the cursor to be set
      while timeout > 0 and not oil.get_cursor_entry() do
        timeout = timeout - 1
      end

      require("oil.actions").preview.callback()
    end
    vim.keymap.set("n", "-", open_with_preview, { desc = "Open parent directory." })
  end
}
