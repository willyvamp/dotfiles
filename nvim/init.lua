vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require ("lazy").setup(
  {
    { import = "h.plugins" }
  }
)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- VI mode keybindings
vim.keymap.set("i", "jj", "<ESC>", { silent = true, desc = "exit insert mode" })

-- general key bindings
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move current line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move current line up" })
vim.keymap.set("n", "<A-j>", "V:m '>+1<CR>gv=gv<Esc>", { silent = true, desc = "Move current line down" })
vim.keymap.set("n", "<A-k>", "V:m '<-2<CR>gv=gv<Esc>", { silent = true, desc = "Move current line up" })

-- nvim-tree key bindings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })
 
-- telescope key bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

