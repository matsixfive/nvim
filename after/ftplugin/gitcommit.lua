vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = "72"
vim.opt_local.formatoptions:remove("o")
vim.api.nvim_buf_add_highlight(0, -1, "ColorColumn", 0, 39, 40)

-- move cursor to first blank line
local line = vim.fn.search("^[^#]", "nW")
if line > 0 then
	vim.cmd("normal! " .. line .. "G")
end
