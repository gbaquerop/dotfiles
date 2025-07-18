-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
})

--Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope find files" })

--Neotree
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal current<CR>")

--Terminal
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("n", "<leader>ot", function()
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.cmd("vertical-resize -15")
	vim.cmd("terminal")
end, { noremap = true, silent = true })

--Manipulating Code
vim.keymap.set("n", "<leader>md", "ddp", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<leader>mu", "ddkP", { silent = true, desc = "Move line up" })

vim.keymap.set("n", "<leader>dl", ":t .<CR>", { silent = true, desc = "Duplicate line" })

--Rustaceanvim
vim.g.rustaceanvim = function ()
	return {
		server = {
			default_settins = {
				['rust-analyzer'] = {
					completion = {
						autoimport = {
							enable = false
						}
					}
				}
			}
		}
	}
end
