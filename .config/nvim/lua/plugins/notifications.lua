-- ============================================================================
-- Notification
-- ============================================================================

return {
    -- 1. Noice.nvim (UI for messages, cmdline, and hover docs)
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            popupmenu = {
                enabled = true,
                backend = "nui",
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
            },
        },
    },

    -- 2. Nvim-Notify (Floating Notifications)
    {
        "rcarriga/nvim-notify",
        opts = {
            stages = "fade",
            timeout = 3000,
            background_colour = "#000000",
            fps = 60,
            level = "info",
        },
        config = function()
            require("notify").setup()
            vim.notify = require("notify")
        end,
    },

    {
        "folke/trouble.nvim",
        opts = {}, -- use default options or customize as needed
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols / Outline (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }
}
