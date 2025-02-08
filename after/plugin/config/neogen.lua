require('neogen').setup({})

vim.keymap.set("n", "<leader>dc", function() require('neogen').generate({ type = "func", }) end, opts)
