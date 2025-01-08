-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'rcarriga/nvim-notify'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip'
	use 'onsails/lspkind.nvim'
	use 'hrsh7th/vim-vsnip'
	use "hrsh7th/cmp-nvim-lsp"
	use 'MunifTanjim/nui.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use {'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons'}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		'folke/noice.nvim',
		requires = {
			{ 'MunifTanjim/nui.nvim' },
			{ 'rcarriga/nvim-notify' },
		},
	}
	use 'neovim/nvim-lspconfig'
	use 'gbprod/substitute.nvim'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
	use {'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	end}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'markvincze/panda-vim'
	use {
	    "windwp/nvim-autopairs",
	    event = "InsertEnter",
	    config = function()
		require("nvim-autopairs").setup {}
	    end
	}
	use 'github/copilot.vim'
	use 'ibhagwan/fzf-lua'
	use 'voldikss/vim-floaterm'

        -- fzf and fzf.vim
	use {'junegunn/fzf', run = './install --all'}
        use 'junegunn/fzf.vim'
	     
        -- nvim-fzy for floating window support
        use 'vijaymarupudi/nvim-fzy'
end)
