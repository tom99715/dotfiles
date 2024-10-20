return {
    "preservim/nerdtree",
    lazy = false, -- load during startup
    config = function()
      vim.cmd([[
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * NERDTree
      ]])
      vim.g.NERDTreeGitStatusWithFlags = 1
      vim.g.NERDTreeIgnore = { '^node_modules$' }
    end,
  }
  