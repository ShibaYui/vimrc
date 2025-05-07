set number
set ai
set tabstop=4
set wrap
set ic
set cursorline
set hlsearch

" Keep the current line centered in the window while editing 
set scrolloff=999
set virtualedit=all

" setting vim for 256 colors
set t_Co=256 

" auto indent as below previous line  
set autoindent	
syntax on

" call message-generator
" read path: expand('%')
" read filename: expand('%:t')
" read basename: expand('%:t:r')
func! MessageGenerator()
	let s:current_user = $USER
	let l:current_date = strftime("%Y-%m-%d %H:%M:%S %z")
	let l:current_filename = expand('%:t')
	exec "%s/%DATE%/" . l:current_date . "/g"
	exec "%s/%FILENAME%/" . l:current_filename . "/g"
	exec "%s/%AUTHOR%/" . s:current_user . "/g"
endfunc

" call ASCII title creator
" Required: figlet (for ASCII art generation)
" Dependency: figlet (https://github.com/cmatsuoka/figlet)
" Prerequisite: figlet must be installed 
func! AsciiTitleGenerator()
	let l:current_title = expand('%:t:r')
	let l:line_num = search('%TITLE%')
    if l:line_num > 0
		" delete the current line which include %TITLE%
        execute l:line_num . 'delete _'
		
        " insert message which created by figlet in current line
        execute l:line_num . 'read !figlet ' . shellescape(l:current_title)
    endif
endfunc
autocmd BufNewFile *.sh 0r ~/.vim/temp/module.sh | call MessageGenerator() | call cursor(8, 4)
autocmd BufNewFile *.py 0r ~/.vim/temp/module.py | call MessageGenerator() | call cursor(8, 4)
autocmd BufNewFile *.txt 0r ~/.vim/temp/module.txt | call MessageGenerator() | call cursor(6, 4)
autocmd BufNewFile *.cpp 0r ~/.vim/temp/module.cpp | call MessageGenerator() | call cursor(7, 4)
autocmd BufNewFile *.work 0r ~/.vim/temp/workReport.txt | call MessageGenerator() | call cursor(11, 4)
autocmd BufNewFile *.md 0r ~/.vim/temp/module.md | call MessageGenerator() | call AsciiTitleGenerator() | call cursor(10, 7)
autocmd BufNewFile note_* 0r ~/.vim/temp/noteDemo.md | call MessageGenerator() | call cursor(15, 4)

" key mapping
inoremap ( ()<esc>i
inoremap " ""<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap < <><esc>i

" colorscheme configuration
" show colcorscheme
map <F2> :so $VIMRUNTIME/syntax/colortest.vim<cr>
" cterm=character_type; ctermfg=frontground-color; ctermbg=background-color
"       bold                    (can use color-code (256 colors ))
"       underline
"       none
""color mirodark
""color evening
hi CursorLine cterm=bold ctermbg=darkgray ctermfg=none
""hi CursorLine cterm=bold ctermbg=007 ctermfg=none
hi LineNr cterm=bold ctermfg=237 ctermbg=none
""hi CursorLineNr cterm=bold ctermfg=white ctermbg=none
hi CursorLineNr cterm=bold ctermfg=red ctermbg=none
hi Comment ctermfg=248

" for printing timestamp
" in normal mode
nnoremap <F12> "=strftime("%Y-%m-%d %H:%M:%S %z")<CR>P
" insert mode
inoremap <F12> <C-R>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>


map <F3> :call HexEditor_xxd()<cr>
	func! HexEditor_xxd()
		exec "w"
		:%! xxd
	endfunc

" for shell checking
" need to install shellcheck
" sudo apt install shellcheck
map <F4> :call Shellcheck()<cr>
	func! Shellcheck()
		exec "w"
		:!sudo chmod a+x %
		:!sh -x %
	endfunc

" Dev tools
map  :call DevTools()<cr>
	func! DevTools()
		exec "w"
		if &filetype == 'sh'
			:!sudo chmod a+x %`
			:!time source %
		elseif &filetype == 'cpp'
			:!time g++ % -o %<
			:!time ./%<  		
		elseif &filetype == 'c'
			:!time gcc % -o %<
			:!time ./%< 
		elseif &filetype == 'python'
			:!time python3 %
		elseif &filetype == 'markdown'
		"Ref. https://github.com/charmbracelet/glow
			:!glow %
		endif
	endfunc
