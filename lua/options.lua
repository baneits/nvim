-- =============================================================================
-- OPTIONS
-- =============================================================================

-- Line options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.breakindent = true -- If the line is wrapped, the new line is indented
vim.opt.scrolloff = 8 -- keep 8 line above/below cursor
vim.opt.sidescrolloff = 8 -- keep 8 characters to left/right cursor

-- indentation and tab management
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Split windows
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- Search settings
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

-- Undo managements
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- word settings
vim.opt.iskeyword:append("-") -- include - in-words

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Local project config
vim.o.exrc = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true
