return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		--Latex
		vim.g.vimtex_view_method = "zathura"
		vim.g.recolor = true
		vim.g.vimtex_compiler_method = 'latexmk'
		vim.opt.conceallevel = 1
		vim.g.tex_conceal = 'abdmg'
	end,
}
