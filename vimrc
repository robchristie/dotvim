set nocompatible

"==================================================================
"|| vim-plug                                                     ||
"==================================================================
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colours
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

"==================================================================
"|| General                                                      ||
"==================================================================
" Keep undo history across sessions, by storing in file.
"if has('persistent_undo')
"    silent !mkdir -p ~/.vim/backup/swap > /dev/null 2>&1
"    set undodir=~/.vim/tmp
"    set undofile
"endif

set history=1000
set showcmd                         " Show incomplete cmds down the bottom
set showmode                        " Show current mode down the bottom
set ruler                           " Show current position
set wildmenu                        " Turn on wild menu
set wildmode=longest:full,full
set number                          " Turn on line numbering
set showmatch                       " Highlight matching braces
set title                           " Display filename in window title
set incsearch                       " Turn on incremental search
set hlsearch                        " Highlight search
set scrolloff=10                    " Keep n lines visible when scrolling
set laststatus=2                    " Make status line always visible
set ch=2                            " Make command line 2 lines high
set bs=2                            " Allow backspace to delete
set autoread                        " Autoread externally edited files
autocmd BufEnter * lcd %:p:h        " Set to current working dir
set formatoptions-=t                " Stop autowrapping long lines

set backup                          " Enable backup
set backupdir=~/.local/share/nvim/swap
set undofile
set undodir=~/.config/nvim/tmp

" Set to wrap and not break in the middle of words
set wrap linebreak nolist

" Default space configuration
set tabstop=2                       " Default tabstop
set shiftwidth=2                    " Default tabstop
set expandtab                       " Default tab setting

""" Restore cursor to last position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Set cwd to current file
autocmd BufEnter * silent! lcd %:p:h

"==================================================================
"|| nvim terminal stuff                                          || 
"==================================================================
" Window split settings
highlight TermCursor ctermfg=red guifg=red

" terminal emulator
tnoremap <Esc> <C-\><C-n>

" Move between windows (with ALT-hold)
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"==================================================================
"|| Colours                                                      ||
"==================================================================
"set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"set t_Co=256
set background=dark
syntax enable
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let g:airline_powerline_fonts=1
let g:airline_theme='molokai'

" Set colorcolumn based on textwidth variable
execute "set colorcolumn=".join(map(range(2,259),'"+".v:val'),',')
highlight ColorColumn ctermbg=0

"==================================================================
"|| Bindings                                                     ||
"==================================================================
map <F7> :setlocal spell! spelllang=en_au<CR>

set pastetoggle=<F10>

" Use gk/j for wrap mode, but don't break vcount functionality
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')


"==================================================================
"|| Plugins                                                      ||
"==================================================================

"--------------------------------------------
"| vim-indent-guides                        |
"--------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1c1c1c ctermbg=234
