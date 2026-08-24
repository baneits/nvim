vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua", name = "nvim-tree" },
})

require("nvim-tree").setup({})
vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })
