return {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
        require("image").setup()
    end
}
