local wk_status, wk = pcall(require, "which-key")
if not wk_status then
	return
end

local terminal_status, terminal = pcall(require, "toggleterm.terminal")
if not terminal_status then
	return
end

local Terminal = terminal.Terminal

local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

local toggle_lazygit = function()
	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
	return lazygit:toggle()
end

local mappings = {
	q = { ":q<cr>", "Quit" },
	Q = { ":wq<cr>", "Save & Quit" },
	w = { ":w<cr>", "Save" },
	x = { ":bw<cr>", "Close" },
	C = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
	c = {
		name = "Custom formatting",
		f = { ":%!jq .<cr>", "Format" },
		u = { ":%!jq -c .<cr>", "Unformat" },
	},
	l = {
		name = "LSP",
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		-- k = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help'},
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
		D = { "<cmd>lua vim.lsp.buf.delaration()<CR>", "Go to declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
		e = {
			'<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>',
			"Show line diagnostics",
		},
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = { ":Gvdiffsplit<cr>", "Git Diff" },
	},
	h = {
		name = "Harpoon",
		h = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>', "Menu" },
		a = { ':lua require("harpoon.mark").add_file()<cr>', "Add file" },
	},
	t = {
		t = { ":ToggleTerm<cr>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
	},
}

local opts = {
	prefix = "<leader>",
}

wk.register(mappings, opts)
