-- https://github.com/gbprod/substitute.nvim
require("substitute").setup()

vim.keymap.set("n", "<leader>s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "<leader>ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "<leader>S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "<leader>s", require('substitute').visual, { noremap = true })

-- place this in one of your configuration file(s)
require('hop').setup()
hop = require('hop')
directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader>e', function()
  hop.hint_char1({ })
end, {remap=true, silent=true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
