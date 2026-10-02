-- ============================================================================
-- Git Integration
-- ============================================================================

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",     -- required
        "sindrets/diffview.nvim",    -- optional - superb side-by-side diff views
        "nvim-telescope/telescope.nvim", -- optional - for picking branches/commits
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gs", "<cmd>Neogit<CR>", desc = "Open Magit/Neogit status" },
    },
    opts = {
        kind = "tab", -- Open Neogit in a clean dedicated tab (or use "split", "floating", etc.)
        integrations = {
            telescope = true,
            diffview = true,
        },
    },
}
