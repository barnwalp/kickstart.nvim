-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- NeoTree Toggle config
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    -- lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          width = 23,
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              git = true,
            },
            glyphs = {
              folder = {
                arrow_closed = '➤',
                -- arrow_open = '˅',
              },
            },
          },
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
  },
}
