-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
	{"github/copilot.vim"},
	{"windwp/nvim-autopairs",
		config = function ()
			require("nvim-autopairs").setup {}
		end,
	},
	{"nvim-tree/nvim-tree.lua",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		cmd = {"NvimTreeToggle", "NvimTreeFocus"},
		opts = {
			filters = {
				dotfiles = false,
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				adaptive_size = false,
				side = "left",
				width = 30,
				preserve_window_proportions = true,
			},
			git = {
				enable = false,
				ignore = true
			}
		},
		config = function (_, opts)
			require("nvim-tree").setup(opts)
			vim.g.nvimtree_side = opts.view.side
			vim.cmd.hi("NvimTreeNormal", "guibg=NONE")
		end,
	},
	{
		"saecki/crates.nvim",
		ft = {"rust", "toml"},
		config = function (_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
			vim.keymap.set("n", "<leader>rcu", crates.update_all_crates)
		end,
	},
}
