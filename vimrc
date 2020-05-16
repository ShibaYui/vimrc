set ai
set cursorline
set enc=utf8
set hls
set number
set ic
set tabstop=4
set wrap
set scrolloff=3


"<F5> Compile and Run
"c, cpp, java, python, shell script
map <F5> :call CompileRun()<cr>
	func! CompileRun()		
		exec "w"
		if &filetype == 'c'
			exec "!gcc % -o %<"
			exec "! ./%<"

		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "! ./%<"

		elseif &filetype == 'java'
			exec "!javac %"
			exec "!java %<"
		
		elseif &filetype == 'python'
			exec "!python %"

		elseif &filetype == 'sh'
			exec "!chmod a+x %"
			exec "! ./%"
		endif
	endfunc

"<F6> GDB
map <F6> :call GDB()<cr>
	func! GDB()
		exec "w"
		if &filetype == 'c'
			exec "!gcc % -o %< -gstabs+"

		elseif &filetype == 'cpp'
			exec "!g++ % -o %< -gstabs+"
		endif
		exec "!gdb %<"
	endfunc
