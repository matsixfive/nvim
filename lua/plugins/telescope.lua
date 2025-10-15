vim.keymap.set('n', '<leader>vh',
	require("telescope.builtin").help_tags,
	{ desc = "Telescope vim help" }
)

vim.keymap.set('n', '<leader>pg',
	require("telescope.builtin").live_grep,
	{ desc = "Telescope live grep" }
)
vim.keymap.set('n', '<leader>pf',
	require("telescope.builtin").find_files,
	{ desc = "Telescope find files" }
)

vim.keymap.set('n', '<leader>pd',
	require("telescope.builtin").diagnostics,
	{ desc = "Telescope diagnostic" }
)
vim.keymap.set('n', '<leader>pe',
	function()
		require("telescope.builtin").diagnostics({ severity = "error" })
	end,
	{ desc = "Telescope errors" }
)

vim.keymap.set('n', '<leader>cs',
	function()
		require("telescope.builtin").colorscheme({ enable_preview = true })
	end,
	{ desc = "Telescope colorscheme" }
)

vim.keymap.set('n', '<C-p>',
	function()
		local _, ret, _ = require("telescope.utils").get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
		if ret == 0 then
			require("telescope.builtin").git_files()
		else
			require("telescope.builtin").find_files()
		end
	end, { desc = "Telescope git files" }
)

local function shorten_path_to_length(path, max_length)
	-- Split path by "/"
	local parts = {}
	for part in string.gmatch(path, "[^/]+") do
		table.insert(parts, part)
	end

	local n = #parts
	if n == 0 then return "" end

	-- Original lengths
	local lengths = {}
	local total_length = -1 -- offset one '/' at start

	for i, part in ipairs(parts) do
		lengths[i] = #part
		total_length = total_length + lengths[i] + 1
	end

	-- If already fits, return full path
	if total_length <= max_length then
		return table.concat(parts, "/")
	end

	-- Calculate how much to trim
	local to_trim = total_length - max_length

	-- Trim parts proportionally, skipping first part
	local final_lengths = {}
	for i = 1, n do final_lengths[i] = lengths[i] end

	for i = 2, n do
		local reducible = lengths[i] - 1
		local trim = math.min(to_trim, reducible)
		final_lengths[i] = lengths[i] - trim
		to_trim = to_trim - trim
		if to_trim <= 0 then break end
	end

	-- If we still couldn't trim enough, force minimum size
	if to_trim > 0 then
		for i = 2, n do
			final_lengths[i] = 1
		end
	end

	-- Build the shortened path
	local shortened = {}
	for i = 1, n do
		table.insert(shortened, string.sub(parts[i], 1, final_lengths[i]))
	end

	return table.concat(shortened, "/")
end

vim.api.nvim_create_autocmd("User", {

	pattern = "TelescopeFindPre",
	callback = function()
		vim.opt_local.winborder = "none"
		vim.api.nvim_create_autocmd("WinLeave", {
			once = true,
			callback = function()
				vim.opt_local.winborder = "rounded"
			end,

		})
	end,
})

return {
	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		opts = {
			defaults = {
				danamic_preview_title = true,
				path_display = { "truncate", "filename_first" },
				mappings = {
					i = {
						["<C-j>"] = require('telescope.actions').move_selection_next,
						["<C-k>"] = require('telescope.actions').move_selection_previous,
					}
				},
			},
		}
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim', },
		lazy = true
	}
}
