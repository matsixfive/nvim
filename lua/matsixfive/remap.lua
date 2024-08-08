vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- move lines up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- move line below to end of line
vim.keymap.set("n", "J", "mzJ`z")

-- select last edited text
vim.keymap.set("n", "gV", "`[v`]")

-- stay centred
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- indent and outdent stay in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- (in/de)crement digit under cursor
vim.keymap.set("n", "<leader>a", "a <ESC>h<C-a>lxh")
vim.keymap.set("n", "<leader>x", "a <ESC>h<C-x>lxh")

-- copy to windows clipboard from WSL
vim.keymap.set("v", "<leader>c", "<cmd>'<,'>w !clip.exe<CR><CR>", { silent = true })

vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>bprev<CR>")


vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

vim.keymap.set("n", "Q", "<nop>")

-- -- toggle mut keyword in rust
-- vim.keymap.set('n', '<leader>m',
-- function()
-- 	local line = vim.fn.getline('.')
-- 	local line_num = vim.fn.line('.')
-- 	local mut = string.find(line, 'let mut ')
--
-- 	if mut then
-- 		local new = line:gsub('let mut ', 'let ')
-- 		vim.fn.setline(line_num, new)
-- 	else
-- 		local new = line:gsub('let ', 'let mut ')
-- 		vim.fn.setline(line_num, new)
-- 	end
-- end, {})
