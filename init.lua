require("vim._core.ui2").enable({})

-- import bare minimum
require("options")
require("keymaps")
require("commands")

-- Import plugins
require("completion.conform")
require("completion.lsp")
require("completion.treesitter")
require("ui.lualine")
require("ui.tokyonight")
require("utils.mini")
require("utils.which-key")
require("utils.telescope")
require("utils.nvim-tree")
