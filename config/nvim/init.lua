if vim.g.vscode then
    require "config.vscode_keymaps"
else
    require("config.options")
    require("config.keymaps")
    require("config.autocmd")
    require("config.lazy")
    vim.cmd [[colorscheme catppuccin-mocha]]
end
