-- ============================================================================
-- LSP, AUTOCOMPLETION, AND FORMATTING (NATIVE NEOVIM 0.11+ API)
-- ============================================================================

return {
    -- Mason (Manages LSPs, linters, and formatters)
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Mason LSP Config (Ensures servers are installed)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",  -- Lua
                "ts_ls",   -- TypeScript / JavaScript / React
                "pyright", -- Python
                "gopls",   -- Go
                "svelte",  -- Svelte
                "html",    -- HTML
                "cssls",   -- CSS
                "jsonls",  -- JSON
            },
            automatic_installation = true,
        },
    },

    -- Native LSP Configuration (Using Modern vim.lsp.config & vim.lsp.enable)
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local servers = { "lua_ls", "ts_ls", "pyright", "gopls", "svelte", "html", "cssls", "jsonls" }

            -- Configure and enable each server natively without require("lspconfig")
            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end

            -- Global LSP Keymaps (triggered when an LSP attaches to a buffer)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
                        vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                        vim.tbl_extend("force", opts, { desc = "Go to definition" }))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover,
                        vim.tbl_extend("force", opts, { desc = "Show documentation hover" }))
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
                        vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
                        vim.tbl_extend("force", opts, { desc = "Smart rename variable" }))
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                        vim.tbl_extend("force", opts, { desc = "Code actions" }))
                    vim.keymap.set("n", "gr", vim.lsp.buf.references,
                        vim.tbl_extend("force", opts, { desc = "Show references" }))
                end,
            })
        end,
    },

    -- Autocompletion Engine (nvim-cmp)
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Formatting Engine (conform.nvim)
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                python = { "black" },
                go = { "gofmt" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
