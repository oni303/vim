set nocompatible
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
set hlsearch
set ai
set si
set ci
au BufWinLeave * mkview
au BufWinEnter * silent loadview
filetype plugin on
set shiftwidth=4
set tabstop=4

set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone,menu
set pumheight=15

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set relativenumber

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

let g:languagetool_jar=$HOME . '/.vim/LanguageTool/languagetool-commandline.jar'
let g:languagetool_lang='de-DE'
map <F7> :LanguageToolCheck
map <F8> :LanguageToolClear



set tags+=~/.vim/tags/avr
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>      
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
nmap <C-F11> :TagbarToggle<CR> 


au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

"map alt+space to esc
map <M-Space> <Esc>
noremap <M-Space> <Esc>
inoremap <M-Space> <Esc>

"map strg+space to esc
map <S-Space> <Esc>
noremap <S-Space> <Esc>
inoremap <S-Space> <Esc>

"map \m to :w + :make
nnoremap <Leader>m :w<cr>:make<cr>
"\p for :Project
"nnoremap <Leader>p :Project 

hi cCustomFunc cterm=bold guifg=DarkGreen gui=bold
hi cCustomClass ctermfg=2 gui=bold guifg=#60ff60
hi cCustomStructMember guifg=orange

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc

"more colors
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"nnoremap <silent> <buffer> <F7> :CSearch -s project -x declarations<cr>
"nnoremap <silent> <buffer> <F6> :CSearchContext<cr>

"let g:acp_behaviorCEclimLength = 2
"function MeetsForCEclim(context)
"	  return g:acp_behaviorCEclimLength >= 0 &&
"	          \ (a:context =~ '\k\.\k\{0,}$' || a:context =~ '\k\->\k\{0,}$' || a:context =~ '\k\{6,}$')
"  endfunction
"function MeetsForC(context)
"	return (a:context =~ '\k\{2,}$')
"endfunction
"  let g:acp_behavior = {
"      \ 'c': [{
"          \ 'command': "\<c-x>\<c-u>",
"          \ 'completefunc' : 'eclim#c#complete#CodeComplete',
"          \ 'meets'        : 'MeetsForCEclim',
"        \ }, {
"        \ 'command': "\<c-x>\<c-n>",
"        \ 'meets'        : 'MeetsForC',
"      \ }]
"    \ }
