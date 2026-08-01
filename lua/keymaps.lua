vim.g.mapleader = vim.keycode("<Space>") -- equivalent to vim.g.mapleader = ' '

-- Restarting configuration
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear serch highlighting", silent = true })

-- Open file explorer
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw file explorer" })

-- Copy/Paste without yanking
vim.keymap.set("n", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- Split window control
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- Move lines up and down
vim.keymap.set("v", "<A-j>", ":m '+1<CR>==", { desc = "Moves line down" })
vim.keymap.set("v", "<A-k>", ":m '-2<CR>==", { desc = "Moves line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Moves selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Moves selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
-- Control indentation visual selection
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
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Togle Undotree" })
