"Check if autoload exists"
if empty(glob("~/.config/nvim/autoload"))
	execute '!mkdir -p ~/.config/nvim/autoload'
endif

"Copy this init.vim into place if one doesn't exist already"
if empty(glob("~/.config/nvim/init.vim"))
	execute "!cp $MYVIMRC ~/.config/nvim/init.vim"
endif

"Check if plugged exists"
if empty(glob("~/.vim/plugged"))
	execute '!mkdir -p ~/.vim/plugged'
endif

"vim-plug autoinstall"
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"Set flag for install"
let g:installed="true"
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

"Install plugins if we installed"
if exists("g:installed")
	:PlugInstall
endif

"Color Settings"

set background=dark
colorscheme solarized

"FileType settings"

filetype plugin indent on

"Tern settings

let g:tern_show_argument_hints="on hold"

"NeoMake Settings"
autocmd! BufWritePost * Neomake 
