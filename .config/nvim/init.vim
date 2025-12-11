

" =======================================
" 1. vim-plug Setup
" =======================================
call plug#begin('~/.local/share/nvim/plugged')

" Telescope's dependency (essential utilities)
Plug 'nvim-lua/plenary.nvim'
" Add the minimal Snacks utility plugin
Plug 'folke/snacks.nvim'
" Bufferline Plugin (for the top tab bar)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' } " Use the latest stable version
" Devicons Plugin
Plug 'nvim-tree/nvim-web-devicons'
" Catppuccin Theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Treesitter (for better syntax highlighting and code understanding)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Dependencies/Tools
Plug 'neovim/nvim-lspconfig'         " The LSP client configuration
Plug 'williamboman/mason.nvim'         " Universal language server installer
Plug 'williamboman/mason-lspconfig' " Connects Mason to nvim-lspconfig
Plug 'hrsh7th/cmp-nvim-lsp'          " Completion source for LSP
Plug 'hrsh7th/nvim-cmp'              " Completion engine itself
Plug 'L3MON4D3/LuaSnip'              " Snippet engine (often required for completion)
Plug 'onsails/lspkind.nvim'          " Adds icons to the completion menu

" GitHub Copilot Plugin
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

" Core Git Wrapper (Fugitive)
Plug 'tpope/vim-fugitive'
" Git Status Signs (Gitsigns)
Plug 'lewis6991/gitsigns.nvim'
" Commenting Pluginq
Plug 'numToStr/Comment.nvim'
" Conform.nvim (code formatting)
Plug 'stevearc/conform.nvim'
" Markdown preview
Plug 'MeanderingProgrammer/render-markdown.nvim', { 'requires': 'nvim-treesitter/nvim-treesitter' }
call plug#end()
		

" =======================================
" 2. Configuration and Keymaps
" =======================================

" Define your leader key (defaults to \)
let mapleader = " "

" Load and Setup Devicons FIRST (needs to be loaded before: other plugins use them)
lua require('nvim-web-devicons').setup()

" Load the Catppuccin Configuration and set the colorscheme
lua require('config.catppuccin')

" Load Treesitter Configuration
lua require('config.treesitter')

lua require('mason').setup()

" Initialize the Comment.nvim plugin
lua require('Comment').setup()

" Enable GitHub Copilot
lua require("CopilotChat").setup()

" Load the Bufferline Lua configuration
lua require('config.bufferline')

" Load the fast 'snacks' picker configuration and keymaps
lua require('config.snacks')

" Load Git Signs configuration
lua require('config.gitsigns')

" Load LSP Configuration (Handles auto-starting TypeScript/Volar)
lua require('config.lsp')

" Load Completion (nvim-cmp) Configuration
lua require('config.cmp')

" Load Conform.nvim Configuration
lua require("config.conform")

" Bufferline Navigation
nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>


" =======================================
" 3. Basic Vim/Nvim Options
" =======================================

" Shows the absolute line number for every line
set number
