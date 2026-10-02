-- ============================================================================
-- LAZY.NVIM - Plugin Manager Bootstrap & Setup
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Automatically bootstrap lazy.nvim if it's not installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim and tell it to load files from lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Automatically imports all files inside lua/plugins/
  },
  checker = {
    enabled = true,   -- Automatically check for plugin updates
    notify = false,   -- Don't spam notifications when updates are available
  },
  change_detection = {
    notify = false,   -- Don't notify when config files change and reload
  },
})
