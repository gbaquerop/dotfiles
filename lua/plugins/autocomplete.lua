return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"SirVer/ultisnips",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
			end,
			"quangnguyen30192/cmp-nvim-ultisnips",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable,
					["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "ultisnips" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
