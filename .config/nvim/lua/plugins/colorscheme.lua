-- ============================================================================
-- COLORSCHEME - Tokyo Night Theme Setup
-- ============================================================================

return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Load immediately when Neovim starts
  priority = 1000, -- Load this before other plugins so styling is applied correctly
  config = function()
    -- Load the colorscheme inside the config function
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
