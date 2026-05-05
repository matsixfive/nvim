return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
        -- This tells lazy.nvim: "Only load this plugin when I press one of these keys"
        keys = {
            { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Telescope vim help" },
            { "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
            { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
            { "<leader>pd", "<cmd>Telescope diagnostics<cr>", desc = "Telescope diagnostic" },
            { 
                "<leader>pe", 
                function() require("telescope.builtin").diagnostics({ severity = "error" }) end, 
                desc = "Telescope errors" 
            },
            { 
                "<leader>cs", 
                function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, 
                desc = "Telescope colorscheme" 
            },
            {
                "<C-p>",
                function()
                    local _, ret, _ = require("telescope.utils").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
                    if ret == 0 then
                        require("telescope.builtin").git_files()
                    else
                        require("telescope.builtin").find_files()
                    end
                end,
                desc = "Telescope git files",
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            -- We define mappings here because they require the 'telescope.actions' module
            opts.defaults.mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            }

            telescope.setup(opts)
            telescope.load_extension("ui-select")
        end,
        opts = {
            defaults = {
                dynamic_preview_title = true,
                path_display = { "truncate", "filename_first" },
            },
        },
    },
}