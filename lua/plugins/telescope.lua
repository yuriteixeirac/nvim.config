return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = "Telescope",
    keys = {
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
	{ "<leader>fg", "<cmd>Telescope live grep<cr>", desc = "Live grep" }
    },
    
    config = function()
	    local telescope = require("telescope")
	    local actions = require("telescope.actions")

	    telescope.setup({
		defaults = {
			file_ignore_patterns = { "node_modules", ".git/", "__pycache__/" }
		}
	    })

	    telescope.load_extension("fzf")
	end,
}
