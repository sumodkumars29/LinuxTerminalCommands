-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Buffers
--vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
--vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
--vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
--vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

vim.g.tmux_navigator_no_mappings = 1 -- Disable default mappings

-- Manually set split navigation inside Neovim
vim.keymap.set("n", "<BS>", "<C-w>h", opts, { desc = "Move left (C-h and Backspace)" })
vim.keymap.set("n", "<C-j>", "<C-w>j", opts, { desc = "Move down (Ctrl+j)" })
vim.keymap.set("n", "<C-k>", "<C-w>k", opts, { desc = "Move up (Ctrl+k)" })
vim.keymap.set("n", "<C-l>", "<C-w>l", opts, { desc = "Move right (Ctrl+l)" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts, { desc = "Toggle line wrapping (<Space>+lw)" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts, { desc = "Indent selection to the left and remain in VISUAL mode" })
vim.keymap.set("v", ">", ">gv", opts, { desc = "Indent selection to the right and remain in VISUAL mode" })

-- Keep last yanked when pasting
vim.keymap.set(
	"v",
	"p",
	'"_dP',
	opts,
	{
		desc = "After yanking with 'y' and pasting over a selection, the copied text is retained in the clipboard and not over written with the text that was pasted over.",
	}
)
