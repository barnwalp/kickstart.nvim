-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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

-- NeoTree Toggle config
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>')

-- overwrite the keymap declared in init.lu
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- VISUAL mode mappings
-- s, x, v modes are handled the same way by which_key
require('which-key').register({
  -- ...
  ['<C-g>'] = {
    c = { ":<C-u>'<,'>GpChatNew<cr>", 'Visual Chat New' },
    p = { ":<C-u>'<,'>GpChatPaste<cr>", 'Visual Chat Paste' },
    t = { ":<C-u>'<,'>GpChatToggle<cr>", 'Visual Toggle Chat' },

    ['<C-x>'] = { ":<C-u>'<,'>GpChatNew split<cr>", 'Visual Chat New split' },
    ['<C-v>'] = { ":<C-u>'<,'>GpChatNew vsplit<cr>", 'Visual Chat New vsplit' },
    ['<C-t>'] = { ":<C-u>'<,'>GpChatNew tabnew<cr>", 'Visual Chat New tabnew' },

    r = { ":<C-u>'<,'>GpRewrite<cr>", 'Visual Rewrite' },
    a = { ":<C-u>'<,'>GpAppend<cr>", 'Visual Append (after)' },
    b = { ":<C-u>'<,'>GpPrepend<cr>", 'Visual Prepend (before)' },
    i = { ":<C-u>'<,'>GpImplement<cr>", 'Implement selection' },

    g = {
      name = 'generate into new ..',
      p = { ":<C-u>'<,'>GpPopup<cr>", 'Visual Popup' },
      e = { ":<C-u>'<,'>GpEnew<cr>", 'Visual GpEnew' },
      n = { ":<C-u>'<,'>GpNew<cr>", 'Visual GpNew' },
      v = { ":<C-u>'<,'>GpVnew<cr>", 'Visual GpVnew' },
      t = { ":<C-u>'<,'>GpTabnew<cr>", 'Visual GpTabnew' },
    },

    n = { '<cmd>GpNextAgent<cr>', 'Next Agent' },
    s = { '<cmd>GpStop<cr>', 'GpStop' },
    x = { ":<C-u>'<,'>GpContext<cr>", 'Visual GpContext' },

    w = {
      name = 'Whisper',
      w = { ":<C-u>'<,'>GpWhisper<cr>", 'Whisper' },
      r = { ":<C-u>'<,'>GpWhisperRewrite<cr>", 'Whisper Rewrite' },
      a = { ":<C-u>'<,'>GpWhisperAppend<cr>", 'Whisper Append (after)' },
      b = { ":<C-u>'<,'>GpWhisperPrepend<cr>", 'Whisper Prepend (before)' },
      p = { ":<C-u>'<,'>GpWhisperPopup<cr>", 'Whisper Popup' },
      e = { ":<C-u>'<,'>GpWhisperEnew<cr>", 'Whisper Enew' },
      n = { ":<C-u>'<,'>GpWhisperNew<cr>", 'Whisper New' },
      v = { ":<C-u>'<,'>GpWhisperVnew<cr>", 'Whisper Vnew' },
      t = { ":<C-u>'<,'>GpWhisperTabnew<cr>", 'Whisper Tabnew' },
    },
  },
  -- ...
}, {
  mode = 'v', -- VISUAL mode
  prefix = '',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

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
  {
    'robitx/gp.nvim',
    config = function()
      require('gp').setup()

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
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
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        api_key_cmd = nil,
        yank_register = '+',
        edit_with_instructions = {
          diff = false,
          keymaps = {
            close = '<C-c>',
            accept = '<C-y>',
            toggle_diff = '<C-d>',
            toggle_settings = '<C-o>',
            toggle_help = '<C-h>',
            cycle_windows = '<Tab>',
            use_output_as_input = '<C-i>',
          },
        },
        chat = {
          welcome_message = 'WELCOME_MESSAGE',
          loading_text = 'Loading, please wait ...',
          question_sign = '', -- 🙂
          answer_sign = 'ﮧ', -- 🤖
          border_left_sign = '',
          border_right_sign = '',
          max_line_length = 120,
          sessions_window = {
            active_sign = '  ',
            inactive_sign = '  ',
            current_line_sign = '',
            border = {
              style = 'rounded',
              text = {
                top = ' Sessions ',
              },
            },
            win_options = {
              winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
          },
          keymaps = {
            close = '<C-c>',
            yank_last = '<C-y>',
            yank_last_code = '<C-k>',
            scroll_up = '<C-u>',
            scroll_down = '<C-d>',
            new_session = '<C-n>',
            cycle_windows = '<Tab>',
            cycle_modes = '<C-f>',
            next_message = '<C-j>',
            prev_message = '<C-k>',
            select_session = '<Space>',
            rename_session = 'r',
            delete_session = 'd',
            draft_message = '<C-r>',
            edit_message = 'e',
            delete_message = 'd',
            toggle_settings = '<C-o>',
            toggle_sessions = '<C-p>',
            toggle_help = '<C-h>',
            toggle_message_role = '<C-r>',
            toggle_system_role_open = '<C-s>',
            stop_generating = '<C-x>',
          },
        },
        popup_layout = {
          default = 'center',
          center = {
            width = '80%',
            height = '80%',
          },
          right = {
            width = '30%',
            width_settings_open = '50%',
          },
        },
        popup_window = {
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top = ' ChatGPT ',
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = '1',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
          buf_options = {
            filetype = 'markdown',
          },
        },
        system_window = {
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top = ' SYSTEM ',
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = '2',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        popup_input = {
          prompt = '  ',
          border = {
            highlight = 'FloatBorder',
            style = 'rounded',
            text = {
              top_align = 'center',
              top = ' Prompt ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
          submit = '<C-Enter>',
          submit_n = '<Enter>',
          max_visible_lines = 20,
        },
        settings_window = {
          setting_sign = '  ',
          border = {
            style = 'rounded',
            text = {
              top = ' Settings ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        help_window = {
          setting_sign = '  ',
          border = {
            style = 'rounded',
            text = {
              top = ' Help ',
            },
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        },
        openai_params = {
          model = 'gpt-3.5-turbo',
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = 'gpt-3.5-turbo',
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        use_openai_functions_for_edits = false,
        actions_paths = {},
        show_quickfixes_cmd = 'Trouble quickfix',
        predefined_chat_gpt_prompts = 'https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv',
        highlights = {
          help_key = '@symbol',
          help_description = '@comment',
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
}
