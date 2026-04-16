return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers',
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      always_show_bufferline = true,
      separator_style = 'thin',
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Fix common issue where bufferline doesn't show up correctly with neo-tree
    vim.api.nvim_create_autocmd('BufAdd', {
      callback = function()
        vim.schedule(function()
          pcall(function()
            require('bufferline').setup(opts)
          end)
        end)
      end,
    })

    -- Keymaps for navigating buffers
    vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
    vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
  end,
}
