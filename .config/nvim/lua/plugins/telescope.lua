-- ============================================================================
-- TELESCOPE - Fuzzy Finder & Navigation
-- ============================================================================

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- Use a stable release tag
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    
    -- Set up keymaps using our space leader key
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
