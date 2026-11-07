vim.opt_local.conceallevel = 2

vim.opt_local.spell = true

-- colors copied from obsidian config
vim.opt_local.winbar = vim.fn.expand("%:t:r")
vim.api.nvim_set_hl(0, "WinBar", { fg = "#43d1fb", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#1c9eef", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#fcba28", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#ff567d", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#0ba95b", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#ed203d", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#fc7428", bold = true })
vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#43d1fb", bold = true })

-- fold properties at start (frontmatter)
vim.fn.cursor({0, 0})
local frontmatter_start = vim.fn.searchpos("^---$", "nc")
vim.fn.cursor({frontmatter_start[1] + 1, 0})
local frontmatter_end = vim.fn.searchpos("^---$", "n")
vim.fn.cursor({0, 0})

local is_folded = vim.fn.foldclosed(frontmatter_start[1]) ~= -1
if not is_folded and
	frontmatter_start[1] > 0 and
	frontmatter_end[1] > frontmatter_start[1] then

	local length = frontmatter_end[1] - frontmatter_start[1]
	vim.fn.cursor({frontmatter_start[1], 0})
	vim.cmd("normal! zf" .. length .. "j")
	vim.fn.cursor({frontmatter_end[1], 0})
end
