return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Set up nvim-notify
		require("notify").setup({
			background_colour = "#000000",
		})
		vim.notify = require("notify")

		-- Set up noice.nvim
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				opts = {},
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					input = { view = "cmdline_input", icon = "󰥻 " },
				},
			},
			messages = {
				enabled = true,
				view = "notify",
				opts = {},
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
				kind_icons = true,
			},
			lsp = {
				progress = {
					enabled = true,
					view = "mini",
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = false,
			},
			throttle = 1000 / 30,
			views = {},
			routes = {},
			status = {},
			format = {},
		})

		-- Keybindings for Noice
		vim.keymap.set("n", "<leader>Nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice messages" })
		vim.keymap.set("n", "<leader>Nh", "<cmd>NoiceHistory<CR>", { desc = "Show Noice history" })
		vim.keymap.set("n", "<leader>Nl", "<cmd>NoiceLast<CR>", { desc = "Show last Noice message" })
	end,
}
