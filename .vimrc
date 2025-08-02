set encoding=utf-8
set signcolumn=yes

set tabstop=4
set shiftwidth=4
set expandtab
set ttimeoutlen=10

set number relativenumber
set background=dark

cnoreabbrev dir :Ex
autocmd FileType netrw setlocal number relativenumber

command Opennewdir :split | :Ex
command Vopennewdir :vsplit | :Ex
cnoreabbrev nd Opennewdir
cnoreabbrev vnd Vopennewdir

function FzfOpenFn()
    let t:saved_winid = win_getid()
    let t:saved_buf = bufnr('%')

    call term_start(['bash', '-c', 'fzf --preview="bat --color=always --style=numbers {}" > /tmp/fzf-buffer'], { 
                \ 'term_finish': 'close', 
                \ 'exit_cb': function('s:FzfCallback'), 
                \ 'curwin': v:true  }) 
endfunction

function s:FzfCallback(_, status)
    let l:result = trim(system('cat /tmp/fzf-buffer'))

    if !empty(l:result)
        execute 'edit ' . fnameescape(l:result)
    else
        if exists('t:saved_winid') && win_gotoid(t:saved_winid)
            if exists('t:saved_buf') && bufexists(t:saved_buf)    
                execute 'buffer ' . t:saved_buf
            endif
        endif
    endif
endfunction

command FzfOpen call FzfOpenFn()
cnoreabbrev fz FzfOpen

runtime! ftplugin/man.vim

let g:coc_global_extensions = ['coc-pyright', 'coc-clangd', 'coc-vimlsp']

call plug#begin()

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
