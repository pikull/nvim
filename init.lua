require("options")
require("remaps")
require("autos")

require("lazy_init")
require("lazy").setup("plugins", {
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
})
