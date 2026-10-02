-- ============================================================================
-- UI PLUGINS
-- ============================================================================

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                },
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    position = "left",
                    width = 30,
                    mappings = {
                        ["<space>"] = "none",
                        ["l"] = "open",
                        ["h"] = "close_node",
                    },
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                    follow_current_file = {
                        enabled = true,
                    },
                },
            })

            -- Toggle Neo-tree with <leader> + e
            vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer sidebar" })
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            spec = {
                -- Group descriptions for your leader keymaps
                { "<leader>f", group = "Find / Telescope" },
                { "<leader>g", group = "Git / Neogit" },
                { "<leader>c", group = "Code Actions" },
                { "<leader>r", group = "Rename / Refactor" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer local keymaps (which-key)",
            },
        },
    }
}
