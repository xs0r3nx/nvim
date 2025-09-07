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
vim.keymap.set('n', '<C-s>', function()
  require('telescope.builtin').find_files({
    cwd = 'src',
  })
end, { desc = 'Telescope find files in src/' })
vim.keymap.set('n', '<leader>cd', function()
  vim.cmd('!cmake -DCMAKE_BUILD_TYPE=Debug -S . -B build/debug && cmake --build build/debug --config Debug')
end, { desc = 'Configure & Build Debug' })
vim.keymap.set('n', '<leader>cr', function()
  vim.cmd('!cmake -DCMAKE_BUILD_TYPE=Release -S . -B build/release && cmake --build build/release --config Release')
end, { desc = 'Configure & Build Release' })
vim.keymap.set('n', '<leader>dr', function()
  vim.cmd('!cmake -DCMAKE_BUILD_TYPE=Release -S . -B build/release && cmake --build build/release --config Release')
end, { desc = 'Configure & Build Release' })
vim.keymap.set('n', '<leader>rd', function()
  local handle = io.popen("find build/debug -maxdepth 1 -type f -executable")
  local result = handle:read("*a")
  handle:close()

  local exe = result:match("[^\r\n]+") -- get first line
  if exe then
    vim.cmd('! ' .. exe)
  else
    print("No executable found in build/debug")
  end
end, { desc = 'Run first Debug executable' })
vim.keymap.set('n', '<leader>rr', function()
  local handle = io.popen("find build/release -maxdepth 1 -type f -executable")
  local result = handle:read("*a")
  handle:close()

  local exe = result:match("[^\r\n]+")
  if exe then
    vim.cmd('! ' .. exe)
  else
    print("No executable found in build/release")
  end
end, { desc = 'Run first Release executable' })
vim.keymap.set('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<CR>')
