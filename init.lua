require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
		component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
vim.cmd("syntax on")
vim.cmd("set termguicolors")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("colorscheme mountain")
vim.opt.clipboard:append("unnamedplus")
local builtin = require('telescope.builtin')
require('mini.indentscope').setup {

  -- Which character to use for drawing scope indicator
  symbol = '',
}

vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Telescope find files' })
