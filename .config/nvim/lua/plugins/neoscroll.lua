return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      easing_function = "quadratic",
    })

    local duration = 50

    local t = tostring(duration)
    local two_t = tostring(duration * 2)

    local map    = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    map['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', t } }
    map['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', t } }
    map['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', two_t } }
    map['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', two_t } }
    -- map['<C-y>'] = nil
    -- map['<C-e>'] = nil
    map['zt']    = { 'zt', { t } }
    map['zz']    = { 'zz', { t } }
    map['zb']    = { 'zb', { t } }

    require('neoscroll.config').set_mappings(map)
  end
}
