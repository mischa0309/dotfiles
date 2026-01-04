vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'

vim.o.scrolloff = 10

vim.o.winborder = 'rounded'

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- somewhere early in your config (after colorscheme is fine)
vim.diagnostic.config({
  signs = {
    -- icons per severity (requires a Nerd Font)
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- nf-cod-error
      [vim.diagnostic.severity.WARN]  = "", -- nf-cod-warning
      [vim.diagnostic.severity.INFO]  = "", -- nf-cod-info
      [vim.diagnostic.severity.HINT]  = "󰌶", -- nf-md-lightbulb_on_outline
    },
  },
})
