-- Autocommands
local augroup = vim.api.nvim_create_augroup("userConfig", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = augroup,
	callback = function()
		vim.hl.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Wrap, linebreak and spellcheck on markdown and text files",
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true -- set spelling language with the command ':setlocal spell spelllang=en_us' (in my case en_us, fr_fr)
	end,
})

-- Add commands to add/delete/update plugins
vim.api.nvim_create_user_command("PackAdd", function(opts)
	vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (:PackAdd user/repo1 user/repo2)" })

-- Pack Delete and Update cmds are built-in on Nightly 0.13
vim.api.nvim_create_user_command("PackDel", function(opts)
	vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
	-- checks if any argument is passed
	if opts.args:match("%S") then
		-- update specific plugins
		local plugins = vim.split(opts.args, "%s+", { trimempty = true })
		-- update only specified plugins
		vim.pack.update(plugins)
	else
		-- update all
		vim.pack.update()
	end
end, { nargs = "*", desc = "Update all plugins or specific ones (accept changes with ':w')" })
