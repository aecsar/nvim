vim.pack.add { 'https://github.com/rmagatti/auto-session' }

require('auto-session').setup {
  auto_session_suppress_dirs = { '~/', '~/code', '~/Downloads', '/' },
}
