"""""""""""" Vundle """"""""""""""""""'
set nocompatible              " be iMproved, required
filetype off                  " required
set ff=unix

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let g:autotagTagsFile=".tags"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
call vundle#end()            " required

filetype plugin indent on    " required
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""" End Vundle """"""""""""""""""'
"" allow mouse scrolling
set mouse=a
set ruler
set nu
let mapleader = ","
let maplocalleader = ","
execute pathogen#infect()
if has("autocmd")
	" Enable filetype detection
	filetype plugin indent on
	" Restore cursor position
	autocmd BufReadPost *
	            \ if line("'\"") > 1 && line("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif
endif
syntax on
"" gutter completion menu
set wildmenu
"
"" New split windows are to the bottom and right
set splitbelow
set splitright

" root starts at .
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ 'AcceptSelection("v")': ['<c-v>'],
  \ 'AcceptSelection("h")': ['<c-h>'],
  \ }
set runtimepath^=~/.vim/bundle/ctrlp.vim
:nmap <C-\> :CtrlP<CR>

set hlsearch

:nmap Z :tabprev<CR>
:nmap X :tabnext<CR>

" navigate quick checks
:nmap q[ :cp<CR>
:nmap q] :cn<CR>


set backspace=indent,eol,start
colorscheme default
set ts=2 sts=2 sw=2

" syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_ruby_exec = $HOME.'/.rbenv/shims/ruby'
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
"let g:syntastic_go_checkers = ['gometalinter']
let g:go_list_type = "quickfix"
let g:syntastic_warning_symbol = '∙∙'
set omnifunc=syntaxcomplete#Complete
" fish
au BufRead,BufNewFile *.fish set expandtab ts=2 sts=2 sw=2
" JS
au BufRead,BufNewFile *.js set expandtab ts=2 sts=2 sw=2
" CoffeeScripts
au BufRead,BufNewFile *.coffee set expandtab ts=2 sts=2 sw=2
" Ruby
au BufRead,BufNewFile *.rb set expandtab ts=2 sts=2 sw=2
au BufRead,BufNewFile *.rake set expandtab ts=2 sts=2 sw=2
au BufRead,BufNewFile Rakefile set expandtab ts=2 sts=2 sw=2
" indent in visual mode
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
au FileType ruby vmap c I#<Esc>
au FileType ruby nmap <Leader>sf :call RunCurrentSpecFile()<CR>
au FileType ruby nmap <Leader>sn :call RunNearestSpec()<CR>
au FileType ruby nmap <Leader>ss :call RunLastSpec()<CR>
au FileType ruby nmap <Leader>sa :call RunAllSpecs()<CR>
au FileType ruby nmap <Leader>R :!ruby %<CR>
au FileType ruby nmap <Leader>r :!bundle exec ruby %<CR>
" Haskell
au BufRead,BufNewFile *.hs set expandtab ts=2 sts=2 sw=2
" Python
au BufRead,BufNewFile *.py set expandtab ts=4 sts=4 sw=4
" Scheme
au BufRead,BufNewFile *.scm set expandtab
au BufRead,BufNewFile *.txt set ai tw=78
" Markdown
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn   set filetype=mkd
" Go
au BufRead,BufNewFile *.go set filetype=go expandtab ts=4 sts=4 sw=4
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_enabled = 1
let g:go_bin_path = "/usr/local/bin/go"
let $GOPATH = $HOME."/gopath"
let g:go_doc_browser_host = "http://localhost:6060"
let g:go_gorename_command = "gopls"
function! GoSave()
	GoInstall
	w
endfunction

nmap <leader>0 :on<CR>
nmap <silent><Leader><C-]> <C-w><C-]><C-w>T

au FileType go vmap c I//<Esc>
au FileType go nmap <leader>r :!go run %<CR>
au FileType go nmap <leader>c :GoBuild<CR>
au FileType go nmap <leader>s :call GoSave()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>dd <Plug>(go-doc)
au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap <Leader>o :GoDeclsDir<CR>


nnoremap gr :grep <cword> **<CR>
nnoremap Gr :grep <cword> %:p:h/**<CR>
nnoremap gR :grep '\b<cword>\b' **<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/**<CR>
if has("gui_running")
	" Enable syntax highlighting
	set guifont=Monaco:h14
endif
