vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = require("luasnip.loaders.from_snipmate").lazy_load
})
