local lazypath = vim.fn.stdpath("config") .. "/install/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup( {
    spec = { 
		{import = "lazy_packages",}
	},
    root = lazypath .. "/installed"
} )
