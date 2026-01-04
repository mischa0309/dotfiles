-- Format LSP
vim.keymap.set("n", "<leader>cf", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "Call LSP Formatter" })

-- Code Actions
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>" )

-- Oil
-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Switch Focus with Vim Keys
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<leader>e", "<cmd>Fyler kind=split_left_most<cr>", { desc = "Open Fyler View" })
vim.keymap.set("n", "-", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })

vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanionChat Toggle" })
