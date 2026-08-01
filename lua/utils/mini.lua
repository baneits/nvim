vim.pack.add({ { src = "https://github.com/echasnovski/mini.nvim", name = "mini" } })

-- Pair brackets and others
require("mini.pairs").setup()

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
	content = {
		format = function(notif)
			return notif.msg
		end,
	},
})

-- Icon provider
require("mini.icons").setup()
