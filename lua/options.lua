-- OPTIONS

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation and tab management
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Line wrapping
vim.opt.wrap = false
vim.opt.breakindent = true

-- Split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search settings
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- Undo managements
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- keep cursor at least 8 rows from top/bot
vim.opt.scrolloff = 8

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Local project config
vim.o.exrc = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true
