#!/bin/bash

##	Filename: sync_vim.sh
##	Author: yu1
##	Date: 2024-12-01 15:41:42 +0800
## 
##	Description:
##		sync vim-configuration to /root/vim_config
##

set -x

path_vim_configs="/root/.vim"
path_to_vimrc="/root/.vimrc"

rsync -avP "$path_to_vimrc" .
rsync -avP "$path_vim_configs" .
