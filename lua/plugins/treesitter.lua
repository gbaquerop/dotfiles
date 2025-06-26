return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"c", "lua", "markdown"},
			highlight = {
				enable = true
			}
		})
	end,
}
