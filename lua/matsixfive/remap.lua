vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- use oil instead

-- move lines up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- move to start and end of line
-- vim.keymap.set("n", "H", "^")
-- vim.keymap.set("n", "L", "$")

-- move line below to end of line
vim.keymap.set("n", "J", "mzJ`z")

-- dont yank replaced text
-- vim.keymap.set("v", "p", "P")
-- vim.keymap.set("v", "P", "p")

-- select last edited text
vim.keymap.set("n", "gV", "`[v`]")

-- make variable on current line mut (rust)
-- vim.keymap.set("n", "<leader>m", "mm0:s/let \\(mut\\)\\@!/&mut /<CR>:noh<CR>`m4l")

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
vim.keymap.set("v", "<leader>c", ":'<,'>w !clip.exe<CR><CR>", { silent = true })
-- vim.keymap.set("v", "<leader>c", function()
-- 	local orig_reg = vim.fn.getreg('c')
-- 	-- vim.api.nvim_feedkeys('"cy', "v", true)
-- 	vim.cmd([[silent! normal! "cy]])
-- 	local reg = vim.fn.getreg("c")
-- 	vim.fn.setreg("c", orig_reg)
-- 	print(vim.fn.system("echo '" .. reg:gsub('"', '\\"') .. "' | clip.exe"))
-- end)

vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>")


vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

vim.keymap.set("n", "Q", "<nop>")

-- toggle mut keyword in rust
function ToggleMut()
    local line = vim.fn.getline('.')
		local line_num = vim.fn.line('.')
    local mut = string.find(line, 'mut')

    if mut then
			local replaced = string.gsub(line, ' mut ', ' ')
			vim.fn.setline(line_num, replaced)
    else
			local replaced = string.gsub(line, 'let ', 'let mut ')
			vim.fn.setline(line_num, replaced)
    end
end

vim.api.nvim_set_keymap('n', '<leader>m', [[:lua ToggleMut()<CR>]], { noremap = true, silent = true })
