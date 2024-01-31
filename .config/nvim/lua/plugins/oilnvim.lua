return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup({
      columns = {
        "icon",
        "size",
      },
      view_options = {
        show_hidden = true
      }
    })
    local open_with_preview = function ()
      vim.cmd("Oil")
      require("oil.actions").preview.callback()
    end
    vim.keymap.set("n", "-", open_with_preview, { desc = "Open parent directory." })
  end
}
