require('copilot').setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
})

vim.g.copilot_is_enabled = true
vim.keymap.set({'n', 'i'}, '<M-c>', function()
	require('copilot.suggestion').toggle_auto_trigger()
	vim.g.copilot_is_enabled = not vim.g.copilot_is_enabled
	if vim.g.copilot_is_enabled then
		require("copilot.suggestion").next()
		vim.notify('Copilot enabled')
	else
		require("copilot.suggestion").dismiss()
		vim.notify('Copilot disabled')
	end
end, { noremap = true, silent = true })


