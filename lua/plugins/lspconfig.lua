return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- lsp setup
                ensure_installed = { "lua_ls", "pyright", "clangd", "html", "cssls", "ts_ls" },
                -- end setup
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- lsp setup
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.clangd.setup({})
            lspconfig.html.setup({})
            lspconfig.cssls.setup({})
            lspconfig.ts_ls.setup({})
            -- end setup

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local opts = { buffer = ev.buf, noremap = true, silent = true }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
