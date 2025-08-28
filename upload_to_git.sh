#!/usr/bin/env bash

##	Filename: upload_to_git.sh
##	Author: yu1
##	Initial Release: 2025-08-28 09:50:34 +0800
## 
##	Description:
##		usage: ./upload_to_git.sh "commit"
## 

set -euo pipefail

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <commit>" >&2
	exit 1
fi

commit="$1"

git add .

git commit -m "$commit"

git push -u origin master

