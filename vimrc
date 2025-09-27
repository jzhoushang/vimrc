set encoding=utf-8
set signcolumn=yes

set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab
set ttimeoutlen=10

set number relativenumber
set cursorline

cnoreabbrev dir :Ex
autocmd FileType netrw setlocal number relativenumber

command Opennewdir :split | :Ex
command Vopennewdir :vsplit | :Ex
cnoreabbrev nd Opennewdir
cnoreabbrev vnd Vopennewdir

command ShowSignature call CocActionAsync('doHover')
cnoreabbrev sign ShowSignature

command OpenVimrc execute 'edit ' . expand('~/.vimrc')
command Reload execute 'source ' . expand('~/.vimrc')

runtime! ftplugin/man.vim

let g:coc_global_extensions = ['coc-pyright', 'coc-clangd', 'coc-vimlsp', 'coc-css', 'coc-html', 'coc-tsserver', 'coc-java', 'coc-vimtex']

call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

if $COLORTERM == "truecolor" 
    set termguicolors
    set t_Co=256
    colorscheme catppuccin_mocha
else
    set notermguicolors
end

set background=dark

