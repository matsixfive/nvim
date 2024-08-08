require('oil').setup({
	columns = {
		-- "permissions",
		"icon",
	},
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		-- ["<C-s>"] = "actions.select_vsplit",
		-- ["<C-h>"] = "actions.select_split",
		-- ["<C-t>"] = "actions.select_tab",
		-- ["<C-p>"] = "actions.preview",
		["<Esc>"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["g."] = "actions.toggle_hidden",
	},
	view_options = {
		show_hidden = true,
		-- is_always_hidden = function(name, bufnr)
		-- 	return name == ".."
		-- end,
	},

	-- oil-git-status.nvim options
	win_options = {
		signcolumn = "yes:1",
	},
})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

require('oil-git-status').setup({
  show_ignored = true -- show files that match gitignore with !!
})
