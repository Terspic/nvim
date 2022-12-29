-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
  	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  	vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer')

packer.startup({ function()
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- Languages
	use 'Shatur/neovim-cmake'
	use 'sheerun/vim-polyglot'
	use 'tikhomirov/vim-glsl'
	use 'rust-lang/rust.vim'
	use 'fladson/vim-kitty'
	use 'ron-rs/ron.vim'

	-- Themes
	use 'Terspic/nord.nvim'
	use "rebelot/kanagawa.nvim"

	-- LSP plugins
	use 'neovim/nvim-lspconfig'
    use {"williamboman/mason.nvim" }
    use {"williamboman/mason-lspconfig.nvim" }

	use {
		'jose-elias-alvarez/null-ls.nvim',
		config = function() require('plugins.null_ls') end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind-nvim',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
		},
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require('plugins.treesitter') end,
		run = ':TSUpdate',
	}
	use {
		'mfussenegger/nvim-dap',
		requires = { 'rcarriga/nvim-dap-ui' },
		config = function() require('plugins.dap') end,
	}
	use 'mfussenegger/nvim-dap-python'

	-- Git plugins
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('plugins.gitsigns') end,
	}
	use {
		'sindrets/diffview.nvim',
		config = function() require('plugins.diffview') end,
	}

	-- UI Plugins
	use {
		'nvim-lualine/lualine.nvim',
		config = function() require('plugins.lualine') end,
	}
	use {
		'akinsho/bufferline.nvim',
		config = function()  require("plugins.bufferline") end, -- require('plugins.bufferline') end,
	}

	use {
		'kyazdani42/nvim-tree.lua',
		config = function() require('plugins.nvim-tree') end,
	}
	use {
		'nvim-telescope/telescope.nvim',
		config = function() require('plugins.telescope') end,
		requires = {
			'nvim-telescope/telescope-dap.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
		},
	}
	use {
		'folke/trouble.nvim',
		config = function() require('plugins.trouble') end,
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('plugins.indent-line') end,
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('plugins.autopairs') end,
	}
	use {
		'sindrets/winshift.nvim',
		config = function() require('plugins.winshift') end,
	}
	use {
		'rmagatti/auto-session',
		requires = { 'rmagatti/session-lens' },
		config = function() require('plugins.auto_session') end,
	}
	use {
		'goolord/alpha-nvim',
		config = function() require('plugins.alpha') end,
	}
	use {
		'iamcco/markdown-preview.nvim',
		run = "cd app && npm install",
	}
	use {
		'j-hui/fidget.nvim',
		config = function() require('plugins.fidget') end,
	}

	-- Misc
	use {
		'akinsho/toggleterm.nvim',
		tag = 'v2.*',
		config = function() require('plugins.toggleterm') end,
	}
	use {
		'folke/which-key.nvim',
		config = function() require('plugins.which-key') end,
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('plugins.comment') end,
	}
	if is_bootstrap then
		packer.sync()
	end
end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
})
