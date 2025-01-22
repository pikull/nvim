return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>", opts)
        vim.keymap.set("n", "<leader>pv", ":Neotree filesystem toggle float<CR>", opts)

        local augroup = vim.api.nvim_create_augroup("NeoTreeInit", {})
        vim.api.nvim_create_autocmd("UiEnter", {
            group = augroup,
            callback = function()
                local f = vim.fn.expand("%:p")
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd("Neotree current dir=" .. f)
                    vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
                end
            end,
        })

        vim.g.loaded_netrwPlugin = 1
        vim.g.loaded_netrw = 1
    end,
    opts = {
        filesystem = {
            hijack_netrw_behavior = "open_current",
        },
    },
}
