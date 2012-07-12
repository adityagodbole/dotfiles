function fish_prompt -d "Write out the prompt"
  printf '%s%s%s>%s ' (set_color $fish_color_cwd) (basename (pwd)) (set_color normal) (get_git_prompt)
end

function get_git_branch
	git branch | awk '/^\*/ { print $2 }'
end
function get_git_dirty
	git diff --quiet; or echo '*'
end
function get_git_prompt
	git branch > /dev/null ^&1; or return 1
	printf " %s%s)" (get_git_branch) (get_git_dirty)
end

set -x NODE_PATH /usr/local/lib/node_modules
set -x LC_ALL C

function vim
	/Applications/MacVim.app/Contents/MacOS/Vim $argv
end

function mvim 
	vim -g $argv
end

function e
	mvim $argv
end

function o
	open $argv
end

set -x PATH $PATH ~/.rvm/bin
set -x EDITOR vim

rvm ^&1 > /dev/null
