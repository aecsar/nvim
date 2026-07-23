vim.pack.add {'https://github.com/akinsho/toggleterm.nvim'}

require('toggleterm').setup {
  shade_terminals = false,
  vim.keymap.set('n', '<leader>o', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open floating terminal' }),
}
