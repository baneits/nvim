require("vim._core.ui2").enable({})

-- import bare minimum
require("options")
require("keymaps")
require("commands")

-- Import plugins
require("completion.treesitter")
require("completion.lsp")
require("utils.mini")
