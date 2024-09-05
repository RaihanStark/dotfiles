-- Keymaps for Harpoon
lvim.builtin.which_key.mappings['h'] = {
  name = '+Harpoon',
  l = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', 'Harpoon List' },
  x = { '<cmd>lua require("harpoon.mark").add_file()<CR>', 'Mark File' },
  n = { '<cmd>lua require("harpoon.ui").nav_next()<CR>', 'Next File' },
  p = { '<cmd>lua require("harpoon.ui").nav_prev()<CR>', 'Previous File' },
}

lvim.keys.normal_mode['<S-Up>'] = ':lua require("harpoon.ui").nav_next()<CR>'
lvim.keys.normal_mode['<S-Down>'] = ':lua require("harpoon.ui").nav_prev()<CR>'

-- Keymaps for persistence
lvim.keys.normal_mode['<leader>ss'] = { ':lua require("persistence").load({ last = true })<CR>', { desc = 'Load last session' } }

-- Keymaps for lspsaga
lvim.lsp.buffer_mappings.normal_mode['<leader>la'] = { ':Lspsaga code_action<CR>', { desc = 'Code action' } }
lvim.lsp.buffer_mappings.normal_mode['K'] = { ':Lspsaga hover_doc<CR>', { desc = 'Hover documentation' } }
lvim.lsp.buffer_mappings.normal_mode['gd'] = { ':Lspsaga goto_definition<CR>', { desc = 'Goto definition' } }
lvim.lsp.buffer_mappings.normal_mode['<leader>lr'] = { ':Lspsaga rename<CR>', { desc = 'Rename' } }

-- Keymaps for find files and recent files
-- Todo: add F group so the which key is named "File"
lvim.builtin.which_key.mappings['f'] = {
  name = "+File",
  f = { ':Telescope find_files<CR>', "Find files" },
  r = { ':Telescope oldfiles<CR>', "Recent files" },
}

-- Peek keymaps
lvim.builtin.which_key.mappings['lp'] = {
  name = '+Peek',
  d = { ':Lspsaga peek_definition<CR>', 'Peek definition' },
  D = { ':Lspsaga peek_type_definition<CR>', 'Peek type definition' },
  f = { ':Lspsaga finder<CR>', 'LSP finder' },
}

lvim.keys.normal_mode['<leader>sT'] = { ':TodoTelescope<CR>', { desc = "Todo" } }

-- Keymaps for scrolling and center cursor
lvim.keys.normal_mode['<M-d>'] = "<C-b>zz" -- Scroll up
lvim.keys.normal_mode['<M-b>'] = "<C-d>zz" -- Scroll down
