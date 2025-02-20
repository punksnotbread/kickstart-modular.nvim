return {
  { -- venv-lsp for help with using venvs in monorepo
    'jglasovic/venv-lsp.nvim',
    config = function()
      local venv_lsp = require 'venv-lsp'
      venv_lsp.init()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
