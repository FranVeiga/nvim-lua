vim.o.wrap = false
vim.o.timeoutlen = 200
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autochdir = true
vim.o.whichwrap = "b,s"
vim.o.number = true
vim.o.relativenumber = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.virtualedit = "onemore"
vim.o.swapfile = false
vim.o.hidden = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 1000
vim.o.cmdheight = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 300
vim.o.expandtab = true
vim.o.scrolloff = 6
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"

vim.g.tokyonight_style = "night"
vim.cmd("colorscheme tokyonight")

-- Set leader key
vim.g.mapleader = ' '

-- Helper function for mappings
function Map(mode, key, command)
    vim.api.nvim_set_keymap(mode, key, command, {noremap=true,silent=true})
end

function Toggle_dark()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else vim.o.background = "dark"
    end
end



vim.cmd("noremap q: q::q<cr>")
-- Plugins
require "plugins"
require("luasnip.loaders.from_vscode").load() -- for snippets to work
-- Set the colorscheme after loading plugins




-- Mappings
Map('i','kk','<ESC>') -- kk for entering normal mode
Map("t", "<ESC>", "<C-\\><C-n>") -- ESC for exiting term mode
Map('i', ';;', '<esc>$a;')

-- Window switching
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
-- vim.cmd([[nnoremap <C-k> <C-w>k]])
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-l>", "<C-w>l")


Map("n", "<A-Down>", "<C-w>-")
Map("n", "<A-Up>", "<C-w>+")
Map("n", "<A-Left>", "5<C-w><")
Map("n", "<A-Right>", "5<C-w>>")


Map("v", ">", ">gv")
Map("v", "<", "<gv")
