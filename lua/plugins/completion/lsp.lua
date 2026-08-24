vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink" },
	{ src = "https://github.com/saghen/blink.lib", name = "blink-lib" },
	{ src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", name = "luasnip" },
})

-- Keybinds
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Diagnostics configuration
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

-- Language server activation and configuration
vim.lsp.enable({
	"lua_ls",
	"pylsp",
	"nixd",
	"rust_analyzer",
})

require("lazydev").setup({})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			-- Tell the server to let Neovim handle snippet expansion
			completion = {
				callSnippet = "Replace",
			},
			-- Use LuaJIT (which Neovim uses)
			runtime = {
				version = "LuaJIT",
			},
		},
	},
})

local hostname = vim.uv.os_gethostname()
local lowerHostname = string.lower(hostname)

vim.lsp.config("nixd", {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", ".git" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "alejandra" },
			},
			options = {
				nixos = {
					-- Change the path to your flake config if needed
					expr = '(builtins.getFlake "~/config").nixosConfigurations.' .. lowerHostname .. ".options",
				},
			},
		},
	},
})

-- Completion setup
require("blink.cmp").build():pwait()
require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
		["<C-k>"] = { "select_next", "snippet_forward", "fallback" },
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
	completion = {
		menu = {
			min_width = 35,
			border = "rounded",
			auto_show = true,
		},
	},
	sources = { default = { "lsp", "snippets", "buffer", "path" } },
	fuzzy = { implementation = "prefer_rust" },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink-cmp").get_lsp_capabilities(),
}
