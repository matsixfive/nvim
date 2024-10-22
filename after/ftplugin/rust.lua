local ts_utils = require('nvim-treesitter.ts_utils')

local function delete_range(buf, start_line, start_col, end_line, end_col)
	end_col = end_col - 1
	local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)

	if #lines > 0 then
		if start_line == end_line then
			lines[1] = lines[1]:sub(1, start_col) .. lines[1]:sub(end_col + 1)
		else
			lines[1] = lines[1]:sub(1, start_col)
			lines[#lines] = lines[#lines]:sub(end_col + 1)
		end

		vim.api.nvim_buf_set_lines(buf, start_line - 1, end_line, false, lines)
	end
end

vim.keymap.set('n', '<leader>m', function()
	local node = ts_utils.get_node_at_cursor()

	while node:type() ~= "let_declaration" do
		node = node:parent()
		if not node then
			return
		end
	end

	local mut_start_line
	local mut_start_col
	local name_start_line
	local name_start_col
	for child in node:iter_children() do
		print(child:type())
		if child:type() == "mutable_specifier" then
			local range = { child:range() }
			mut_start_line = range[1] + 1
			mut_start_col = range[2] + 1
		elseif child:type() == "identifier" then
			local range = { child:range() }
			name_start_line = range[1] + 1
			name_start_col = range[2] + 1
		end

		if mut_start_line and mut_start_col and name_start_line and name_start_col then
			break
		end
	end

	if (not mut_start_line) or (not mut_start_col) then
		local insert_str = "mut "
		local buf = vim.api.nvim_get_current_buf()
		local line_content = vim.api.nvim_buf_get_lines(buf, name_start_line - 1, name_start_line, false)[1]
		local new_line_content = line_content:sub(1, name_start_col - 1) .. insert_str .. line_content:sub(name_start_col)
		vim.api.nvim_buf_set_lines(buf, name_start_line - 1, name_start_line, false, { new_line_content })
	else
		delete_range(vim.api.nvim_get_current_buf(), mut_start_line, mut_start_col - 1, name_start_line, name_start_col)
	end
end)
