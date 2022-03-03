set nocompatible

let hostname = substitute(system('hostname'), '\n', '', '')

call plug#begin('~/.vim/plugged')
" Plugins
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mkitt/tabline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-rooter'
Plug 'mechatroner/rainbow_csv'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'ziglang/zig.vim'

" Themes
Plug 'HellRok/Fruidle'
call plug#end()

" Theme
set t_Co=256 " 256 terminal colours
colorscheme fruidle
let indent_guides_auto_colors = 0

" ctrl+tab to switch tabs
nmap <C-Tab> :tabn<CR>
nmap <C-S-Tab> :tabp<CR>
nmap <C-t> :tabnew<CR>

" ctrl+l/h to switch tabs
nmap <C-l> :tabn<CR>
nmap <C-h> :tabp<CR>

" Remap ^] to open in a new tab
nnoremap <C-]> <C-w><C-]><C-w>T
nnoremap <C-\> :CtrlPTag<CR>
" Can't figure out how to 'put' into the ctrlp search thing
"vnoremap <C-\> y:CtrlPTag<CR><C-R>"

" Allow use of the usual hotkeys instead of arrows for ctrlp selection
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
  \ 'PrtHistory(-1)':       ['<down>'],
  \ 'PrtHistory(1)':        ['<up>'],
  \ }

" Turn on indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Prettyness
set list
set listchars=tab:··,trail:·,nbsp:·
set nowrap

" Highlighting
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.jbuilder set filetype=ruby
au BufNewFile,BufRead *.thor set filetype=ruby
au BufNewFile,BufRead *.hamlc set filetype=haml
au BufNewFile,BufRead *.cjsx set filetype=coffee
au BufNewFile,BufRead Dockerfile.* set filetype=dockerfile

" Limit characters in markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" netrw setup
let g:netrw_dirhistmax = 0

" CtrlP Options
let g:ctrlp_user_command = 'rg %s --no-ignore-vcs --files --hidden --color=never'
let g:ctrlp_user_command .= ' --glob "!node_modules"'
let g:ctrlp_user_command .= ' --glob "!.yarn"'
let g:ctrlp_user_command .= ' --glob "!uploads"'
let g:ctrlp_user_command .= ' --glob "!tmp"'
let g:ctrlp_user_command .= ' --glob "!uploads/public"'
let g:ctrlp_user_command .= ' --glob "!rdoc"'
let g:ctrlp_user_command .= ' --glob "!coverage"'
let g:ctrlp_user_command .= ' --glob "!build"'
let g:ctrlp_user_command .= ' --glob "!log"'
let g:ctrlp_user_command .= ' --glob "!tags"'
let g:ctrlp_user_command .= ' --glob "!gems.tags"'
let g:ctrlp_use_caching = 0
let g:ctrlp_root_markers = ['Gemfile', 'project.godot', 'Makefile', '*.gemspec']

set mouse=a    " Turn on mouse
set cursorline " Highlight current line
set number     " Show line numbers
set showmatch  " Show matching brackets when text indicator is over them
set wildmenu   " Show tab completion

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable
set spell spelllang=en_au

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set autoindent

" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Always show the status line
set laststatus=2
set ruler

" Speed up macro play back
set lazyredraw

" Add library specific tags
set tags+=gems.tags

" Use filetype specific indentation
filetype indent on
filetype plugin on

" Disable messages on mouse hover
set noballooneval

" Disable incremental searching
set noincsearch

" Re-enable once you get a few minutes to fix @s
"set splitbelow
"set splitright
