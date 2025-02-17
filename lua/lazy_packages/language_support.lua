return{
 {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" }, -- Add your desired LSP servers
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    keys = vim.g.lazyBinds.LspConfig,
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup_handlers({
        -- Default setup
        function(server_name)
          lspconfig[server_name].setup({
            root_dir = function(fname)
              return util.root_pattern("*.fsproj",".git", "package.json", "pyproject.toml")(fname)
                or vim.fn.getcwd()
            end,
          })
        end,

        -- Custom setup for specific servers
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            root_dir = util.root_pattern(".git", "init.lua"),
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          })
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp", -- Completion engine
	lazy = false,
    dependencies = {
	  { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },    -- LSP source for nvim-cmp
      { "hrsh7th/cmp-buffer" },      -- Buffer completions
      { "hrsh7th/cmp-path" },        -- Path completions
      { "hrsh7th/cmp-cmdline" },     -- Command-line completions
      { "L3MON4D3/LuaSnip" },        -- Snippet engine
      { "saadparwaiz1/cmp_luasnip" } -- Snippet completions
    },
	config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For LuaSnip users
          end,
        },
		window = {
      		completion = cmp.config.window.bordered(),
      		documentation = cmp.config.window.bordered(),
		},
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Tab>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		ft = "markdown",
		opts = {},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
            ensure_installed = { "all" },
			highlight = {
				enable = true,
				aditional_vim_regex_highlighting = false,
			},
        build = ":TSUpdate",
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
		},
	}
}
