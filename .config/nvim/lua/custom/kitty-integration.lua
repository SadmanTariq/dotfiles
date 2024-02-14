if vim.env.TERMINAL == 'kitty' then
  -- Set kitty background opacity to 100%
  os.execute('kitten @ set-background-opacity 1.0')
  vim.api.nvim_create_autocmd('VimLeavePre', {
    callback = function()
      os.execute('kitten @ set-background-opacity $KITTY_OPACITY')
    end
  })
end
