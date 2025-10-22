vim.keymap.set("n", "<leader>h", function()
	require("harpoon"):list():add()
end, { desc = "Harpoon Add File" })

vim.keymap.set("n", "<C-e>", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Toggle Quick Menu" })

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("harpoon"):list():select(i)
	end, { desc = "Harpoon Go to File " .. i })
end

return {
	"ThePrimeagen/harpoon",
	lazy = true,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.navigate_with_number())
		harpoon:extend({
			-- copied from https://github.com/ThePrimeagen/harpoon/blob/ed1f853847ffd04b2b61c314865665e1dadf22c7/lua/harpoon/extensions/init.lua#L67
			UI_CREATE = function(cx)
				for line_number, file in pairs(cx.contents) do
					if string.find(cx.current_file, file, 1, true) then
						-- highlight the harpoon menu line that corresponds to the current buffer
						vim.api.nvim_buf_add_highlight(cx.bufnr, -1, "@text.title", line_number - 1, 0, -1)

						-- set the position of the cursor in the harpoon menu to the start of the current buffer line
						vim.api.nvim_win_set_cursor(cx.win_id, { line_number, 0 })
					end
				end
			end,
		})
	end,
}
