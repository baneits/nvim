vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" } })

require("nvim-treesitter").install({
	"bash",
	"lua",
	"markdown",
	"markdown_inline",
  "nix",
	"python",
  "rust",
	"vim",
})
