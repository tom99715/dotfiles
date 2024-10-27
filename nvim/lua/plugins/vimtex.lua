return {
  "lervag/vimtex",
  lazy = false,  -- Ensure vimtex loads immediately
  init = function()
    -- Use Skim as the PDF viewer
    vim.g.vimtex_view_method = 'skim'
  end,
}
