-- ============================================================================
-- KEYMAPS - Custom Shortcuts & Leader Key
-- ============================================================================

-- Set leader key to Space (must be set before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set

-- Clear search highlights easily with <leader> + h
keymap('n', '<leader>h', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlights' })

-- Seamless window navigation (Ctrl + h/j/k/l to switch splits)
keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Stay in visual indent mode when shifting text left/right
keymap('v', '<', '<gv', { desc = 'Indent left and stay selected' })
keymap('v', '>', '>gv', { desc = 'Indent right and stay selected' })
