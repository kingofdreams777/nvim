-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
	{"windwp/nvim-autopairs",
	config = function ()
		require("nvim-autopairs").setup {}
	end,
	},
	{"ThePrimeagen/harpoon",
	config  = function ()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>m", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
			vim.keymap.set("n", "<C-h>", function () ui.nav_file(1) end)
			vim.keymap.set("n", "<C-t>", function () ui.nav_file(2) end)
			vim.keymap.set("n", "<C-n>", function () ui.nav_file(3) end)
			vim.keymap.set("n", "<C-s>", function () ui.nav_file(4) end)
			vim.keymap.set("n", "<leader>clear", mark.clear_all)
	end},
	{"simrat39/rust-tools.nvim",
	config = function()
		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function (_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
				-- Code Action Groups
				vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
			dap = {
				adapter = require('rust-tools.dap').get_codelldb_adapter(
						'/home/ross/extensions/vadimcn.vscode-lldb-1.9.0-universal/adapter/codelldb',
						'/home/ross/extensions/vadimcn.vscode-lldb-1.9.0-universal/lldb/lib/liblldb.so'
					)
				}
		})
	end},
}
