require("custom.kitty-integration")

-- Disable the default vim.notify function when the message is about multiple
-- different client offset_encodings. This is a known issue with neovim
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
