-- In ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  -- Define the nvim-lspconfig plugin for lazy.nvim
  'neovim/nvim-lspconfig',

  -- 'config' runs after the plugin is loaded
  config = function()
    local lspconfig = require('lspconfig')

    -- Configure the Python LSP server
    lspconfig.pylsp.setup {
      -- Capabilities for autocompletion are removed for now to simplify.
      -- We can add them back later.
      settings = {
        pylsp = {
          configurationSources = { "flake8", "black" },
          plugins = {
            autopep8 = { enabled = false },
            black = { enabled = true, args = { "--line-length", "88" } },
            flake8 = { enabled = true, maxLineLength = 88, ignore = { "E203","W503" } },
            mypy = { enabled = false },
            pylint = { enabled = false },
          },
        },
      },
    }

    -- You can add other server setups here if needed
    -- lspconfig.tsserver.setup{}

  end,
}
