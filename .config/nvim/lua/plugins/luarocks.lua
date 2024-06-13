return {
  "vhyrro/luarocks.nvim",
  priority = 1001,   -- this plugin needs to run before anything else
  opts = {
    rocks = {
      "magick",  -- For 3rd/image.nvim
    },
  },
}
