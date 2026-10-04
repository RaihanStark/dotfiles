-- ============================================================================
-- COLORSCHEME
-- ============================================================================

-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
        -- Enable transparent background or enforce true #000000
        vim.g.moonflyTransparent = false
        vim.g.moonflyNormalFloat = true
        vim.cmd.colorscheme("moonfly")

        -- Optional: Snap base background to absolute OLED #000000
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#bdbdbd" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0a0a0a" })
    end,
}
