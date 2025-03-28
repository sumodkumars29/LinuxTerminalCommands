return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
        style = storm,
        transparent = true,
      })
      vim.cmd([[colorscheme tokyonight-night]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0b0f" }) -- Explicitly set a background color
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0a0b0f" }) -- Set for inactive windows as well
    end
    }

-->  {
-->    'shaunsingh/nord.nvim',
-->    lazy = false,
-->    priority = 1000,
-->    config = function()
-->	-- Example config in lua
-->	vim.g.nord_contrast = true
-->	vim.g.nord_borders = false
-->	vim.g.nord_disable_background = false
-->	vim.g.nord_italic = false
-->	vim.g.nord_uniform_diff_background = true
-->	vim.g.nord_bold = false
-->
-->	-- Load the colorscheme
-->	require('nord').set()
-->    end
-->  }

