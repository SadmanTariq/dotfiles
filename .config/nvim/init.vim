call plug#begin()
    
if !exists('g:vscode')
    Plug 'bling/vim-airline'

    " Linting
    Plug 'dense-analysis/ale'
    
    " File tree
    Plug 'scrooloose/nerdTree'
    
    " Ctrl+P to switch files
    Plug 'ctrlpvim/ctrlp.vim'
    
    " Better visual indent
    Plug 'Yggdroot/indentLine'
    
    " Python syntax highlighting
    " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    
    " Python indentation
    Plug 'Vimjas/vim-python-pep8-indent'
endif

" gcc to comment/uncomment
Plug 'tpope/vim-commentary'

call plug#end()


" Use deoplete.
" let g:deoplete#enable_at_startup = 1

if !exists('g:vscode')
    
    " Ctrl+n for nerdTree
    nmap <C-n> :NERDTreeToggle<CR>
    
    
    " Set default CtrlP mode to mixed
    let g:ctrlp_cmd = 'CtrlPMixed'
    
    
    " Split direction
    set splitbelow
    set splitright
    
    " Split navigation with Ctrl+HJKL
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

endif


if !exists('g:vscode')

    " Line numbers
    set number relativenumber
    
    " tabstop:          Width of tab character
    " softtabstop:      Fine tunes the amount of white space to be added
    " shiftwidth        Determines the amount of whitespace to add in normal mode
    " expandtab:        When this option is enabled, vi will use spaces instead of tabs
    set tabstop     =4
    set softtabstop =4
    set shiftwidth  =4
    set expandtab
    
    
    let g:ale_linters = {
          \   'python': ['flake8'],
          \   'ruby': ['standardrb', 'rubocop'],
          \   'javascript': ['eslint'],
          \}
          " \   'cpp': ['cpplint'],
          " \   'c': ['cpplint']

    let g:ale_c_parse_compile_commands = 1
    let g:ale_c_parse_makefile = 1

endif
