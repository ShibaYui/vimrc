```
 ____  _____    _    ____  __  __ _____
|  _ \| ____|  / \  |  _ \|  \/  | ____|
| |_) |  _|   / _ \ | | | | |\/| |  _|
|  _ <| |___ / ___ \| |_| | |  | | |___
|_| \_\_____/_/   \_\____/|_|  |_|_____|
```

> Author: yu1

> Release_Date: 2025-04-18 06:02:29 +0800

# yu1's vim configration

## Description
* File Structure
	``` 
	.
	├── colors
	│   └── mirodark.vim
	├── README.md
	├── sync_vim.sh
	├── .vim
	│   ├── colors
	│   │   └── mirodark.vim
	│   └── temp
	│       ├── module.cpp
	│       ├── module.py
	│       ├── module.sh
	│       ├── module.txt
	│       ├── readmeDemo.md
	│       └── workReport.txt
	└── .vimrc 
	```
 
## Inatallation
 

## Packaging
* vim 
	* `apt install vim`


* vim-themes  		
	* Ref. https://colorswat.ch/vim/
	`donwload *.vim and copy to ~/.vim/colors/`


* glow
	* `apt install glow`
 
## Usage
put .vimrc & .vim/ to /root/ & /home/<user-ID>/

:::info
super & normal-user are using different configs
:::
 

## Release
* 2024-12-02 01:02:36 +0800
	* update sync-tool "sync_vim.sh"

* 2024-12-02 01:05:51 +0800
	* update ".vimrc"
   	 	* add function "automatic print Info. on README"
	* update "sync_vim.sh"
		* add command "rm .newrwhist"

* 2024-12-03 12:01:31 +0800
	* update "sync_vim.sh"
	* upload config "module.readme" to ".vim/temp"

* 2024-12-20 09:55:28 +0800
	* add "automatic c-compiled" in Func "DevTools"
 
* 2024-12-05 21:54:47 +0800
	* do configuration in "vimrc"
		* scrolloff=24 -> 999
		* add "set virtualedit=all"

* 2025-01-12 15:02:30 +0800
	* change automatic-compile/exec shortcut from "F5" to "Ctrl+Z"

* 2025-04-18 06:02:29 +0800
	* update README.md
	* add "readmeDemo.md"
	* add "markdown previewer", need package "glow"
	* remove "module.readme"
	* remove "module.releasenote"

* 2025-04-19 05:39:35 +0800
	* add autimatic-input "noteDemo.md"
	* fix some syntax issue

* 2025-04-23 05:34:54 +0800
	* update `.vim/temp/readmeDemo.md`
