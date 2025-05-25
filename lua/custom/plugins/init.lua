vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>j', '<C-W>j')
vim.keymap.set('n', '<leader>k', '<C-W>k')
vim.keymap.set('n', '<leader>h', '<C-W>h')
vim.keymap.set('n', '<leader>l', '<C-W>l')
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.cmd 'highlight Normal ctermbg=none guibg=none'
vim.cmd 'highlight NonText ctermbg=none guibg=none'
-- vim.cmd [[
--   hi Normal guibg=NONE ctermbg=NONE
--   hi VertSplit guibg=NONE ctermbg=NONE
--   hi StatusLine guibg=NONE ctermbg=NONE
-- ]]

-- NeoTree Toggle config
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

-- overwrite the keymap declared in init.lu
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.g.user_emmet_mode = 'a'

return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local common = require 'iron.fts.common'

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { 'zsh' } },
            python = {
              command = { '/Users/pankaj/anaconda3/bin/ipython' },
              format = common.bracketed_paste_python,
              block_dividers = { '# %%', '#%%' },
            },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          -- multiple repl layouts
          repl_open_cmd = {
            view.center('75%', '85%'), -- cmd_1
            view.right '50%', -- cmd_2
          },
        },
        keymaps = {
          toggle_repl_with_cmd_1 = '<space>tf',
          toggle_repl_with_cmd_2 = '<space>tr',
          restart_repl = '<space>rr',
          send_motion = '<space>sc',
          visual_send = '<space>sv',
          send_file = '<space>sfl',
          send_line = '<space>sl',
          send_paragraph = '<space>sp',
          send_until_cursor = '<space>su',
          send_mark = '<space>sm',
          send_code_block = '<space>cb',
          send_code_block_and_move = '<space>cn',
          mark_motion = '<space>mc',
          mark_visual = '<space>mc',
          remove_mark = '<space>md',
          cr = '<space>s<cr>',
          interrupt = '<space>s<space>',
          exit = '<space>sq',
          clear = '<space>cl',
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      }

      -- extra Iron commands
      vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
    end,
  },
  { 'edluffy/hologram.nvim' },
  {
    'dccsillag/magma-nvim',
    build = ':UpdateRemotePlugins',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'mattn/emmet-vim',
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
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
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true, -- or `opts = {}`
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'junegunn/goyo.vim',
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
}
