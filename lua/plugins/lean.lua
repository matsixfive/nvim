return {
	"Julian/lean.nvim",
	event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
  config = function()
		vim.g.lean_config = {
			mappings = true,
		}
	end
}
