local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ';'
vim.o.number = true
vim.o.clipboard = 'unnamed'

keymap("i", "jj", "<ESC>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
-- keymap("n", "<leader>z", "<C-z>", opts)

keymap("n", "<leader>b", ":bnext<CR>", opts)
keymap("n", "<leader>z", ":bw<CR>", opts)

require('plugins')
require('tree')

keymap("n", "tt", ":NvimTreeOpen<CR>", opts)

require('ui')
require('motion')

vim.cmd[[colorscheme panda]]

require('lsp')
require('fzf')

keymap("n", "<leader>f", ":FzfLua files<CR>" , opts)

local char_to_hex = function(c)
  return string.format("%%%02X", string.byte(c))
end

local urlencode = function(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w _%%%-%.~])", char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

local get_selected_text = function()
  local mode = vim.fn.mode()
  return vim.fn.getregion(
    vim.fn.getpos "'<", vim.fn.getpos "'>", { mode = "v" }
  )
end

function _G.search_selected_text()
  text = table.concat(get_selected_text())
  if text == "" then
    print("No text selected!")
    return
  end
  print("Searching for: " .. text)
  q = urlencode(text)
  print(q)
  print(vim.fn.escape(q, '%'))
  vim.cmd('!open ' .. '"https://xxxxxx/search?q=' ..  vim.fn.escape(q, '%')  .. '&num=10&ctx=3"')
end

vim.api.nvim_set_keymap('v', '<leader>vc', [[:lua search_selected_text()<CR>]], { noremap = true, silent = true })
