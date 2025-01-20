return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- lsp setup
                ensure_installed = { "lua_ls", "pyright", "clangd", "html", "cssls", "ts_ls" }
                -- end setup
            })
        end
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
        end
    }
}
