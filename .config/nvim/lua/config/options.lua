-- ============================================================================
-- OPTIONS - Core Editor Behavior
-- ============================================================================

local opt = vim.opt

opt.number = true         -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers (essential for quick jumps)
opt.mouse = ''            -- Disable mouse support in all modes (hard mode, lol)
opt.ignorecase = true     -- Case-insensitive searching...
opt.smartcase = true      -- ...unless capital letters are used in the search term
opt.hlsearch = false      -- Don't permanently highlight all search results after searching
opt.incsearch = true      -- Show incremental search matches as you type
opt.termguicolors = true  -- Enable 24-bit RGB terminal colors for themes
opt.signcolumn = 'yes'    -- Always show the sign column (prevents text from shifting when diagnostics appear)
opt.scrolloff = 8         -- Keep 8 lines visible above and below the cursor when scrolling
opt.updatetime = 50       -- Faster completion and UI update intervals (milliseconds)

-- Indentation Defaults
opt.tabstop = 4        -- Number of visual spaces per tab
opt.shiftwidth = 4     -- Number of spaces for auto-indentation
opt.expandtab = true   -- Convert tabs to spaces
opt.smartindent = true -- Enable smart auto-indenting for blocks

-- System Clipboard Integration
opt.clipboard = 'unnamedplus' -- Sync Neovim clipboard with your OS system clipboard
