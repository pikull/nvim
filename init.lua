require("options")
require("remaps")

require("lazy_init")
require("lazy").setup("plugins", {
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
})

require("autos")
