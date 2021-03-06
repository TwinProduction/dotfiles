if &compatible
	set nocompatible
endif

""""""""""""""""
" gVim support "
""""""""""""""""

if has('gui_running')
	set guioptions-=T  " no toolbar
	colorscheme elflord
endif


"""""""""""
" Plugins "
"""""""""""

"=========== INFO ==========="
" Plugin manager: Plug       "
" Autocompletion: Deoplete   "
"============================"

" reminder: Adding one or more plugins require 
" re-opening .vimrc and executing :PlugInstall
" You can update the plugins with :PlugUpdate

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
endif

" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

call plug#end()


" ======== Plugin config =========

" lightline
set laststatus=2

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"


" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\ 'go': '[^. *\t]\.\w*',
\})


""""""""""""""""""
" END OF PLUGINS "
""""""""""""""""""

""""""""""""
" Autocmds "
""""""""""""

" Automatically jump to last known cursor position on file open
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


"""""""""""""""""""""""""
" General Configuration "
"""""""""""""""""""""""""

" Reset and re-enable filetype detection
filetype off
filetype plugin indent on

" Set TAB size to 4
set tabstop=4
set shiftwidth=4

syntax enable                       " Enable code syntax 
set hlsearch                        " Highlight search results
set incsearch                       " Show match while typing
set autoindent
set backspace=indent,eol,start

set noerrorbells
set noswapfile
set nobackup
set noshowmode                      " lightline takes care of this

set completeopt=menu,menuone

" Remember undo history after file write
"if has("persistent_undo")
"	set undofile
"	set undodir=~/.cache/vim
"endif

" Share clipboard with other vim instances (uses xclip)
set clipboard+=unnamedplus


""""""""""""
" Mappings "
""""""""""""

map <left> 		:echoe "use h instead"<CR>
map <down> 		:echoe "use j instead"<CR>
map <up> 		:echoe "use k instead"<CR>
map <right> 	:echoe "use l instead"<CR>

"imap <left> 	<nop>
"imap <down> 	<nop>
"imap <up> 		<nop>
"imap <right> 	<nop>
