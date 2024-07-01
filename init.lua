local cfg = require("custom.blitz")
vim.g.mapleader = cfg.leader_key

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"richardhbtz/blitz.nvim",
		lazy = false,
		import = "blitz.plugins",
		dependencies = require("custom.blitz").plugins,
		config = function()
			require("blitz.opts")
		end,
	},
})
