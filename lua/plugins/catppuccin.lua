return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin-mocha")
        vim.cmd("highlight normal guibg=none ctermbg=none")
        vim.cmd("highlight NonText guibg=none ctermbg=none")
    end
}
