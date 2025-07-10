return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "texlab", },
			})
		end,
	},
	{
		'simrat39/rust-tools.nvim'

	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config('clangd', {
				capabilities = capabilities
			})

			vim.lsp.config('lua_ls', {
				capabilities = capabilities
			})

			vim.lsp.config('texlab', {
				capabilities = capabilities
			})

			vim.lsp.config('rust_analyzer', {
				capabilities = capabilities
			})
		end,
	},
}
