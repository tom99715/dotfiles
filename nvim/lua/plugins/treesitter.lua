return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- ensure it is loaded at startup
    run = ":TSUpdate", -- keep Treesitter parsers up-to-date
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "c", "cpp", "java", "python", "html", "css", "lua"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  }
  