vim.g.mapleader = vim.keycode('<Space>') -- equivalent to vim.g.mapleader = ' '

-- Restarting configuration
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { desc = "Clear serch highlighting", silent = true })

-- Open file explorer
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw file explorer" })

-- Move lines in viusal selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Control indentin visual selection
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- Keep cursor centered while moving up/down page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Keep cursor centered when searching 
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- Undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set('n', '<leader>u', require("undotree").open, {desc = "Togle Undotree"})
