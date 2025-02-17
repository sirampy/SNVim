-- general keybinds
vim.keymap.set("n", "<Space>", "<nop>")
vim.g.mapleader = " "
 
-- plugin keybinds
vim.g.lazyBinds = {
	 LspConfig = {
		{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {desc = "Go to Definition" }},
		{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {desc = "Go to Declaration" }},
		{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {desc = "Hover Documentation" }},
		{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", {desc = "Go to Implementation" }},
		{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {desc = "Rename Symbol" }},
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {desc = "Code Action" }},
		{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {desc = "References" }},
		{ "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", {desc = "Open Diagnostic" }},
		{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {desc = "Previous Diagnostic" }},
		{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", {desc = "Next Diagnostic" }},
		{ "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {desc = "Format File" }},
	},
	Telescope = { 
		{"<Leader>tk","<cmd>Telescope keymaps<cr>", {desc = "Show Keymapping"}},
		{"<Leader>tg","<cmd>Telescope live_grep<cr>", {desc = "grep files"}},
		{"<Leader>tm","<cmd>Telescope live_grep hidden=true no_ignore=true<cr>", {desc = "grep hidden file"}},
		{"<Leader>tf","<cmd>Telescope find_files<cr>", {desc = "find file"}},
		{"<Leader>ti","<cmd>Telescope find_files hidden=true no_ignore=true<cr>", {desc = "find hidden file"}},
		{"<Leader>tb","<cmd>Telescope buffers<cr>", {desc = "search buffers"}},
	},
	NeoTree = { 
		{"<Leader>e","<cmd>Neotree toggle<cr>", {desc = "search buffers"}},
	},
}

