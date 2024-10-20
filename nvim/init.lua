-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Neovim options
vim.opt.mouse = "a"             -- Enable mouse support
vim.opt.number = true           -- Show line numbers
vim.opt.hidden = true           -- Enable background buffers
vim.opt.cursorline = true       -- Highlight the current line
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.autoindent = true       -- Auto-indent new lines
vim.opt.smartindent = true      -- Smart auto-indenting
vim.opt.shiftwidth = 4          -- Number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 4             -- Number of spaces a tab counts for
vim.opt.encoding = "utf-8"      -- Set encoding to UTF-8
vim.opt.history = 5000          -- Set history limit
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
