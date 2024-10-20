return {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false, -- load during startup
    priority = 1000, -- make sure it's loaded before others
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      vim.cmd([[colorscheme catppuccin]])
    end,
  }
  