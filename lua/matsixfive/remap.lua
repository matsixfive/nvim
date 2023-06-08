vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- use oil instead

-- move lines up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- move line below to end of line
vim.keymap.set("n", "J", "mzJ`z")

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

-- copy to windows clipboard
vim.keymap.set("v", "<leader>c", ":w !clip.exe<CR><CR>")
vim.keymap.set("n", "<leader>c", "V:w !clip.exe<CR><CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
