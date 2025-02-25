return {
  { -- Easypick configuration
    'axkirillov/easypick.nvim',
    requires = {
      'nvim-lua/plenary.nvim', -- ensure the dependency is loaded
    },
    config = function()
      -- Fetch the default branch of the repository or fallback to 'main'
      -- local get_default_branch = "git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
      -- local base_branch = vim.fn.system(get_default_branch):gsub('%s+', '') or 'main'

      require('easypick').setup {
        pickers = {
          -- List files inside current folder with default previewer
          {
            name = 'ls',
            command = 'ls',
            previewer = require('easypick.previewers').default(),
          },

          -- Diff current branch with base_branch and show changed files
          {
            name = 'changed_files',
            command = 'git diff --relative --name-only',
            previewer = require('easypick.previewers').file_diff(),
          },

          -- List files that have conflicts with diffs in preview
          {
            name = 'conflicts',
            command = 'git diff --name-only --diff-filter=U --relative',
            previewer = require('easypick.previewers').file_diff(),
          },
        },
      }

      vim.keymap.set('n', '<leader>sc', ':Easypick changed_files<cr>', { desc = '[S]earch [C]hanged files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
