return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"c", "rust", "toml", "lua", "markdown"},
			auto_install = true,
			highlight = {
				enable = true
			},
			indent = {
				enable = true 
			},
		})
	end,
}
