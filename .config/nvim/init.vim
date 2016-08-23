"vim-plug autoinstall"
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"Terminal Settings"
set splitbelow
set nu
set tabstop=2
set shiftwidth=2
:au BufEnter * if &buftype == 'terminal' | :startinsert | endif
"Plug Settings"

function! Cond(cond, ...)
	let opts = get(a:000, 0, {})
	return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'noahfrederick/vim-neovim-defaults', Cond(!has('nvim'))
Plug 'digitaltoad/vim-pug', {'for': ['jade', 'pug']}
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wookiehangover/jshint.vim'
Plug 'neomake/neomake'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi', {'for': 'python'}
Plug 'vim-perl/vim-perl', { 'for': ['perl', 'perl6'] }
Plug 'mklabs/split-term.vim'
Plug 'vim-airline/vim-airline'
call plug#end()


"Color Settings"

set background=dark
colorscheme solarized

"FileType settings"

filetype plugin indent on
autocmd FileType jade set omnifunc=jadecomplete#CompleteJade
"autocmd FileType pl6 set omnifunc=

"Tern settings

let g:tern_show_argument_hints="on hold"

"NeoMake Settings"
autocmd! BufWritePost * Neomake 
