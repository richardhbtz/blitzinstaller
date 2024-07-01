M = {
	-- greeter
	greeter_open_on_launch = true,
	greeter_message = true,
	greeter_ascii = "hydra",

	-- file explorer
	tree_open_on_launch = true, -- will be ignored if greeter is enabled
	tree_on_the_left = true,

	-- editor
	relative_numbers = true,
	leader_key = " ", -- space key

	-- theming
	theme = "vscode_dark",
	theme_transparency = false,

	-- lsp/treesitter/conform
	languages = {
		"lua",
		-- "rust",
		-- "typescript"
	},

	-- user plugins
	plugins = {
		--{
		--"richardhbtz/presence.nvim",
		--config = function()
		--	require("presence").setup({})
		--end,
		--},
	},
}

return M
