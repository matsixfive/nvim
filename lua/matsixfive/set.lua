vim.opt.number = true
vim.opt.relativenumber = true

local indent = 2
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = false

vim.opt.autoindent = true
vim.opt.smartindent = true

-- sync between two processes
vim.opt.swapfile = false
vim.opt.autoread = true

vim.opt.backup = false
vim.opt.backupcopy = "yes"
vim.opt.undodir = vim.loop.os_homedir() .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmode = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.ftplugin_sql_omni_key = "<leader>sql"

-- wraps zsh to run as interactive shell for things like `:!`
local wrapper_path = os.getenv("HOME") .. "/.local/bin/nvim_zsh_wrapper"
if vim.fn.filereadable(wrapper_path) == 1 then
	vim.opt.shell = wrapper_path
end
