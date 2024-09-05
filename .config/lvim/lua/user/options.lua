-- Editor options

vim.opt.shell = "/bin/sh"
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
lvim.builtin.telescope.theme = "ivy"

-- Exlude user directories from project
lvim.builtin.project.exclude_dirs = {
  '/Users/raihan/'
}

-- Theming

lvim.colorscheme = 'tokyonight-night'
lvim.transparent_window = true
lvim.builtin.treesitter.rainbow.enable = true

local colors = {
  darkgray = "#16161d",
  gray = "#727169",
  innerbg = nil,
  outerbg = "#16161D",
  normal = "#7e9cd8",
  insert = "#98bb6c",
  visual = "#ffa066",
  replace = "#e46876",
  command = "#e6c384",
}

lvim.builtin.lualine.options.theme = {
  inactive = {
    a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },

  },
  visual = {
    a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
  },
  replace = {
    a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
  },
  normal = {
    a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
  },
  insert = {
    a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
  },
  command = {
    a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
    b = { fg = colors.gray, bg = colors.outerbg },
    c = { fg = colors.gray, bg = colors.innerbg },
    x = { fg = colors.gray, bg = colors.innerbg },
    y = { fg = colors.replace, bg = colors.outerbg, gui = "bold" },
  },
}

-- linters

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
  },
}


-- Custom Dashboard

local text = require "lvim.interface.text"
local footer = {
  type = "text",
  val = text.align_center({ width = 0 }, {
    "",
    "Ready for action! 🚀 Let the coding adventure begin!",
    require("lvim.utils.git").get_lvim_version()
  }, 0.5),
  opts = {
    position = "center",
    hl = "Number",
  },
}

local buttons = {
  opts = {
    hl_shortcut = "Include",
    spacing = 1,
  },
  entries = {
    { "f", lvim.icons.ui.FindFile .. "  Find File",          "<CMD>Telescope find_files<CR>" },
    { "n", lvim.icons.ui.NewFile .. "  New File",            "<CMD>ene!<CR>" },
    { "p", lvim.icons.ui.Project .. "  Projects ",           "<CMD>Telescope projects<CR>" },
    { "r", lvim.icons.ui.History .. "  Recent files",        ":Telescope oldfiles <CR>" },
    { "t", lvim.icons.ui.FindText .. "  Find Text",          "<CMD>Telescope live_grep<CR>" },
    { "e", lvim.icons.ui.SignIn .. "  Restore Last Session", "<CMD>lua require('persistence').load({ last = true })<CR>" },
    {
      "c",
      lvim.icons.ui.Gear .. "  Configuration",
      "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
    },
    { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
  },
}

lvim.builtin.alpha.dashboard.section.footer = footer
lvim.builtin.alpha.dashboard.section.buttons = buttons



lvim.builtin.breadcrumbs.active = false
vim.opt.showtabline = 0
lvim.builtin.bufferline.active = false

-- Custom Lualine

local function get_modified_status()
  local modified = vim.bo.modified
  if modified then
    return lvim.icons.ui.Close .. " Unsaved"
  else
    return ""
  end
end

lvim.builtin.lualine.sections.lualine_y = {
  get_modified_status
}
