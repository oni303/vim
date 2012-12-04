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
au BufWinLeave * mkview
au BufWinEnter * silent loadview
filetype plugin on
set shiftwidth=4
set tabstop=4

set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone,menu
set pumheight=15


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
set mouse=a		" Enable mouse usage (all modes) in terminals

let g:languagetool_jar=$HOME . '/.vim/LanguageTool/LanguageTool.jar'
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
nnoremap <Leader> :Project<cr>

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


"       				       	*clang_complete-auto_select*
let g:clang_auto_select =1
"If equal to 0, nothing is selected.
"If equal to 1, automatically select the first entry in the popup menu, but
"without inserting it into the code.
"If equal to 2, automatically select the first entry in the popup menu, and
"insert it into the code.
"Default: 0
"
"       				       	*clang_complete-complete_auto*
let g:clang_complete_auto =1
"If equal to 1, automatically complete after ->, ., ::
"Default: 1
"
"       				       	*clang_complete-copen*
"let g:clang_complete_copen =1
"If equal to 1, open quickfix window on error.
"Default: 0
"
"       				       	*clang_complete-hl_errors*
"       				       	*g:clang_hl_errors*
"If equal to 1, it will highlight the warnings and errors the same way clang
"does it.
"Default: 1
"
"       				       	*clang_complete-periodic_quickfix*
"       				       	*g:clang_periodic_quickfix*
"If equal to 1, it will periodically update the quickfix window.
"Default: 0
"Note: You could use the g:ClangUpdateQuickFix() to do the same with a mapping.
"
"       				       	*clang_complete-snippets*
let g:clang_snippets = 1
"If equal to 1, it will do some snippets magic after a ( or a , inside function
"call. Not currently fully working.
"Default: 0
"
"				       	*clang_complete-snippets_engine*
let g:clang_snippets_engine = "snipmate"
"The snippets engine (clang_complete, snipmate, ultisnips... see the snippets
"subdirectory).
"Default: "clang_complete"
"
"       				       	*clang_complete-conceal_snippets*
"       				       	*g:clang_conceal_snippets*
"If equal to 1, vim will use vim 7.3 conceal feature to hide <# and #> which
"delimit a snippets.
"Default: 1 (0 if conceal not available)
"Note: See concealcursor and conceallevel for conceal configuration.
"
"       				       	*clang_close-preview*
let g:clang_close_preview =1
"If equal to 1, the preview window will be close automatically after a
"completion.
"Default: 0
"
"       				       	*clang_complete-exec*
"       				       	*g:clang_exec*
"Name or path of clang executable.
"Note: Use this if clang has a non-standard name, or isn't in the path.
"Default: "clang"
"
"       				      	*clang_complete-user_options*
"       				       	*g:clang_user_options*
"Option added at the end of clang command. Useful if you want to filter the
"result, or do other stuffs. To ignore the error code returned by clang, set
"|g:clang_exec| to `"clang` and |g:clang_user_options| to `2>/dev/null || exit
"0"` if you're on *nix, or `2>NUL || exit 0"` if you are on windows.
"Default: ""
"
"       				       	*clang_complete-auto_user_options*
"       				       	*g:clang_auto_user_options*
"Set sources for user options passed to clang. Available sources are:
"- path - use &path content as list of include directories (relative paths are
"  ignored);
"- .clang_complete - use information from .clang_complete file Multiple options
"  are separated by comma;
"- {anything} else will be treaded as a custom option source in the following
"  manner: clang_complete will try to load autoload-function named
"  getopts#{anything}#getopts, which then will be able to modify
"  b:clang_user_options variable. See help on |autoload| if you don't know
"  what it is.
"  
"An example of custom option sources is bundled with clang_complete and called
""gcc". This source runs gcc to get a list of include paths. The list of
"include paths for each of supported filetypes (c, cpp, objc and objcpp) is
"cached on a disk and can be removed by calling ClearGCCIncludeCaches()
"function (for changes to take affect one needs to reread buffers using the
":edit command or something equivalent).
"Default: "path, .clang_complete, gcc"
"
"       				       	*clang_complete-use_library*
"let g:clang_use_library =1
"Instead of calling the clang/clang++ tool use libclang directly. This gives
"access to many more clang features. Furthermore it automatically caches all
"includes in memory. Updates after changes in the same file will therefore be a
"lot faster.
"Default: 0
"
"       				       	*clang_complete-library_path*
"       				       	*g:clang_library_path*
"If libclang.[dll/so/dylib] is not in your library search path, set this to the
"absolute path where libclang is available.
"Default: ""
"
"					*clang_complete-sort_algo*
"					*g:clang_sort_algo*
"How results are sorted (alpha, priority, none). Currently only works with
"libclang.
"Default: "priority"
"
"					*clang_complete-complete_macros*
let g:clang_complete_macros=1
"If clang should complete preprocessor macros and constants.
"Default: 0
"
"					*clang_complete-complete_patterns*
let g:clang_complete_patterns =1 
"If clang should complete code patterns, i.e loop constructs etc.
"Defaut: 0


"map!  <silent> <c-p> <C-Up>

"map!  <silent> <c-n> <C-Down>
