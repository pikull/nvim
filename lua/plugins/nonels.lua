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
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- Lua, Luau

					null_ls.builtins.formatting.prettierd, -- Angular, CSS, Flow, GraphQL, HTML,
					-- JSON, JSX, JavaScript, LESS, Markdown, SCSS, TypeScript, Vue, YAML

					require("none-ls.diagnostics.eslint_d"), -- JavaScript

					null_ls.builtins.formatting.isort, -- Python
					null_ls.builtins.formatting.black, -- Python
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("LspFormatting", {}),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
		end,
	},
}
