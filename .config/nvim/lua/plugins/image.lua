if vim.env.TERMINAL == 'kitty' then
    return {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("image").setup()
        end
    }
else
    return {}
end
