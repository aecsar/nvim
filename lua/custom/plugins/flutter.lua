vim.pack.add { 'https://github.com/dart-lang/dart-vim-plugin' }
vim.pack.add { 'https://github.com/akinsho/flutter-tools.nvim'}

-- dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },

-- require('dart-vim-plugin').setup({})

require('flutter-tools').setup {
  options = {
    debugger = {
      -- make these two params true to enable debug mode
      enabled = false,
      run_via_dap = false,
      register_configurations = function(_)
        require('dap').adapters.dart = {
          type = 'executable',
          command = vim.fn.stdpath 'data' .. '/mason/bin/dart-debug-adapter',
          args = { 'flutter' },
          -- args = { 'debug_adapter' },
        }

        require('dap').configurations.dart = {
          {
            type = 'dart',
            request = 'launch',
            name = 'Launch flutter',
            dartSdkPath = '$HOME/tools/flutter/bin/cache/dart-sdk/',
            flutterSdkPath = '$HOME/tools/flutter',
            program = '${workspaceFolder}/lib/main.dart',
            cwd = '${workspaceFolder}',
          },
        }
        -- uncomment below line if you've launch.json file already in your vscode setup
        -- require("dap.ext.vscode").load_launchjs()
      end,
    },
    dev_log = {
      -- set to true when you run without DAP
      enabled = true,
      open_cmd = 'tabedit',
    },
    -- lsp = {
    --   on_attach = require('lvim.lsp').common_on_attach,
    --   capabilities = require('lvim.lsp').default_capabilities,
    -- },
  },
}

vim.keymap.set('n', '<leader>fl', '<cmd>FlutterLogToggle<cr>', { desc = 'Toggle Flutter Log' })

