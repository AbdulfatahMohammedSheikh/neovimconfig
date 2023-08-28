return {
    'mfussenegger/nvim-dap',
    config = function()
        -- TODO: find a way to add a dap for rust
        -- Dart / Flutter
        local dap = require('dap')
        dap.adapters.dart = {
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
            args = { 'dart' }
        }
        dap.adapters.flutter = {
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/bin/dart-debug-adapter',
            args = { 'flutter' }
        }
        dap.configurations.dart = {
            {
                type = "dart",
                request = "launch",
                name = "Launch dart",
                dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
                flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
                program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
                cwd = "${workspaceFolder}",
            },
            {
                type = "flutter",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/", -- ensure this is correct
                flutterSdkPath = "/opt/flutter",                  -- ensure this is correct
                program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
                cwd = "${workspaceFolder}",
            }
        }

        vim.keymap.set('n', '<leader>d', ':DapContinue<CR>')
        vim.keymap.set('n', '<leader>dp', ':DapToggleBreakpoint<CR>')
        vim.keymap.set('n', '<leader>de', ':DapTerminate<CR>')
    end,
}
