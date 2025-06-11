return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>:<BS>"),
	vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>:<BS>"),
	vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>:<BS>"),
	vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>:<BS>"),
}
