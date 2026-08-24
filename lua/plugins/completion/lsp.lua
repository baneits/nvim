vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink" },
	{ src = "https://github.com/saghen/blink.lib", name = "blink-lib" },
	{ src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
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
require("blink.cmp").setup({

	fuzzy = { implementation = "lua" },
	completion = {
		trigger = {
			show_on_trigger_character = true,
			show_on_keyword = true,
			show_on_backspace = true,
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		menu = {
			auto_show = true,
			border = "rounded",
			min_width = 35,
			auto_show_delay_ms = 100,
		},
	},
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
		["<C-k>"] = { "select_next", "snippet_forward", "fallback" },
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
	sources = {
		default = { "lsp", "snippets", "buffer", "path" },
		providers = {
			-- lazydev = {
			-- 	name = "LazyDev",
			-- 	module = "lazydev.integrations.blink",
			-- 	-- make lazydev completions top priority (see `:h blink.cmp`)
			-- 	score_offset = 100,
			-- },
		},
	},
})
