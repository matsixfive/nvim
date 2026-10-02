local oil = require("oil")

vim.keymap.set("n", "<leader>o", function()
	local entry = oil.get_cursor_entry()
	if not entry then
		vim.notify("No entry under cursor", vim.log.levels.WARN)
		return
	end
	local path = oil.get_current_dir() .. entry.name
	vim.ui.open(path)
end, { desc = "Open file" })

vim.api.nvim_set_hl(0, "OilModRs", { bold = true })
local ns = vim.api.nvim_create_namespace("oil_mod_rs")
local function highlight_mod_rs()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	for i, line in ipairs(lines) do
		if line:find("mod%.rs") then
			vim.api.nvim_buf_add_highlight(buf, ns, "OilModRs", i - 1, 0, -1)
		end
	end
end
vim.api.nvim_create_autocmd("CursorMoved", {
	buffer = 0,
	callback = highlight_mod_rs,
})
highlight_mod_rs()

local function git_add(path)
	local cmd = { "git", "add", path }
	print(vim.inspect(cmd))
	local result = vim.fn.system(cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify("Git add failed: " .. result, vim.log.levels.ERROR)
	else
		vim.notify("Git add succeeded: " .. path, vim.log.levels.INFO)
	end
end

vim.keymap.set("n", "<leader>ga",
	function()
		-- local entry = oil.get_cursor_entry()
		-- local filename = entry.name
		-- vim.print(filename)
		local dir = oil.get_current_dir()
		-- local fullpath = vim.fs.joinpath(dir, filename)
		-- vim.print(fullpath)
		git_add(dir)
	end
	, { desc = "Git add current dir", buffer = true })

vim.keymap.set("v", "<leader>ga", function()
	local start_pos = vim.fn.getpos("v")[2]
	local end_pos = vim.fn.getpos(".")[2]

	if start_pos > end_pos then
		start_pos, end_pos = end_pos, start_pos
	end

	local dir = oil.get_current_dir()

	for line_num = start_pos, end_pos do
		local entry = oil.get_entry_on_line(0, line_num)
		if not entry then
			goto continue
		end

		local filename = entry.name
		if filename == ".." then
			goto continue
		end

		local fullpath = vim.fs.joinpath(dir, filename)
		git_add(fullpath)

		::continue::
	end
end, { desc = "Git add selected files", silent = true, buffer = true })
