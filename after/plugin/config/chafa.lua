require("chafa").setup({
  render = {
    min_padding = 5,
    show_label = true,
  },
  events = {
    update_on_nvim_resize = true,
  },
})

-- local baleia = require("baleia").setup({ })
--
-- -- Command to colorize the current buffer
-- vim.api.nvim_create_user_command("BaleiaColorize", function()
-- 	baleia.once(vim.api.nvim_get_current_buf())
-- end, { bang = true })
