require("core.options") -- Load general options (options.lua from lua/core/)
require("core.keymaps") -- Load keymaps (keymaps.lua from lua/core/)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({

	checker = {
		enabled = true,
		notify = false,
	},

	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
	-- NOTE: Plugins can also be added by using a table, with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
	-- Alternatively, use `config = function() ... end` for full control over the configuration.
	-- If you prefer to call `setup` explicitly, use:
	--    {
	--        'lewis6991/gitsigns.nvim',
	--        config = function()
	--            require('gitsigns').setup({
	--                -- Your  configuration here
	--            })
	--        end,
	--    }
	--  {
	--    "nvim-neo-tree/neo-tree.nvim",
	--    branch = "v3.x",
	--    dependencies = {
	--      "nvim-lua/plenary.nvim",
	--      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--      "MunifTanjim/nui.nvim",
	--      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	--    }
	--  },
	{
		"christoomey/vim-tmux-navigator",
	},

	require("plugins.colortheme"),
	--    require 'plugins.neotree',
	require("plugins.nvim-tree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.which_key"),
	require("plugins.telescope"),
	require("plugins.alpha"),
	require("plugins.dressing"),
	require("plugins.auto-pairs"),
	require("plugins.indent-blankline"),
	require("plugins.surround"),
	require("plugins.vim-maximizer"),
	require("plugins.autocomplete"),
	require("plugins.mason"),
	-- require("plugins.lsp"),
	require("plugins.formatting"),
	require("plugins.lspjosean"),
	require("plugins.trouble"),
	require("plugins.autosession"),
	require("plugins.comments"),
	require("plugins.substitute"),
	require("plugins.noice"),

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},

		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				highlight = { enable = true }, -- enable syntax highlighting
				indent = { enable = true }, -- enable indentation
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"cpp",
					"php",
					"php_only",
					"python",
					"sql",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			-- setup nvim-ts-autotag separately
			require("nvim-ts-autotag").setup({})
		end,
	},
})
