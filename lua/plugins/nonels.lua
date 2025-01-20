return {
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "stylua", "prettierd", "eslint_d", "isort", "python" },
                automatic_installation = false,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua, -- Lua, Luau

                    null_ls.builtins.formatting.prettierd, -- Angular, CSS, Flow, GraphQL, HTML,
                    -- JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML
                    --
                    null_ls.builtins.diagnostics.eslint_d, -- JavaScript

                    null_ls.builtins.formatting.isort, -- Python
                    null_ls.builtins.formatting.black, -- Python
                },
            })
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
        end,
    },
}
