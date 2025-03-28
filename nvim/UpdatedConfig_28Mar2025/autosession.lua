return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		-- Fix session options as recommended
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		-- Use updated config names
		auto_session.setup({
			auto_restore = false, -- Corrected name
			suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" }, -- Corrected name
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
	end,
}
