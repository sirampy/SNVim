local lazypath = vim.fn.stdpath("config") .. "/package_managers/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup( {
    spec = { 
		{import = "lazy_packages",}
	},
    root = lazypath .. "/installed"
} )
