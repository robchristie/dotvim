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
set history=1000

"==================================================================
"|| nvim terminal stuff                                          || 
"==================================================================
" Window split settings
highlight TermCursor ctermfg=red guifg=red

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
