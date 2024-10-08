local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  callback = function()
    require("vim.highlight").on_yank { higroup = "IncSearch", timeout = 100 }
  end,
  group = general,
  desc = "Highlight when yanking",
})
