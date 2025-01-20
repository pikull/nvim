vim.api.nvim_create_autocmd({ "BufWritePre", "VimLeave" }, {
    group = vim.api.nvim_create_augroup("AutoIndent", {}),
    pattern = "*",
    command = "normal! gg=G",
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 50 })
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = {  buffer = ev.buf, noremap = true, silent = true }
        vim.keymap.set('n', "K", vim.lsp.buf.hover, opts)
        vim.keymap.set('n', "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set({'n', 'v'}, "<leader>ca", vim.lsp.buf.code_action, opts)
    end
})
