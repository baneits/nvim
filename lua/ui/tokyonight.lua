vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" },
	{ src = "https://github.com/tadaa/vimade", name = "vimade" },
})

require("tokyonight").setup({
	transparent = true,
})
vim.cmd.colorscheme("tokyonight")

require("vimade").setup({
	recipe = { "minimalist", { animate = true } },
	fadelevel = 0.6,
})
