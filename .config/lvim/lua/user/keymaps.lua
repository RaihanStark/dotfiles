-- Keymaps for Harpoon
lvim.keys.normal_mode['hl'] = '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>'
lvim.keys.normal_mode['hx'] = ':lua require("harpoon.mark").add_file()<CR>'
lvim.keys.normal_mode['<S-Up>'] = ':lua require("harpoon.ui").nav_next()<CR>'
lvim.keys.normal_mode['<S-Down>'] = ':lua require("harpoon.ui").nav_prev()<CR>'

-- Keymaps for persistence
lvim.keys.normal_mode['<leader>ss'] = { ':lua require("persistence").load({ last = true })<CR>', { desc = 'Load last session' } }

-- Keymaps for lspsaga
lvim.lsp.buffer_mappings.normal_mode['<leader>la'] = { ':Lspsaga code_action<CR>', { desc = 'Code action' } }

-- TODO: Add p group so the which key is named "Peek"
lvim.keys.normal_mode['<leader>lpd'] = { ':Lspsaga peek_definition<CR>', { desc = 'Peek definition' } }
lvim.keys.normal_mode['<leader>lpD'] = { ':Lspsaga peek_type_definition<CR>', { desc = 'Peek type definition' } }
lvim.keys.normal_mode['<leader>lpf'] = { ':Lspsaga finder<CR>', { desc = 'LSP finder' } }

lvim.lsp.buffer_mappings.normal_mode['K'] = { ':Lspsaga hover_doc<CR>', { desc = 'Hover documentation' } }
lvim.lsp.buffer_mappings.normal_mode['gd'] = { ':Lspsaga goto_definition<CR>', { desc = 'Goto definition' } }
lvim.lsp.buffer_mappings.normal_mode['<leader>lr'] = { ':Lspsaga rename<CR>', { desc = 'Rename' } }
