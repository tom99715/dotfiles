return {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false, -- load during startup
    config = function()
      vim.g.coc_global_extensions = {
        'coc-html', 'coc-tsserver', 'coc-sumneko-lua', 'coc-sh',
        'coc-pyright', 'coc-json', 'coc-java', 'coc-css', 'coc-clangd'
      }
      -- coc.nvim key mappings
      vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
      vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
      vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})
      vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
      vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
      vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<CR>', {silent = true})
      vim.api.nvim_set_keymap('n', '<space>d', ':<C-u>CocList diagnostics<CR>', {silent = true})
      vim.api.nvim_set_keymap('n', '<leader>do', '<Plug>(coc-codeaction)', {silent = true})
      vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {silent = true})
    end,
  }
  