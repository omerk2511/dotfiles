export ZSH="/home/omerk/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	colorize
	zsh-autosuggestions
	zsh-syntax-highlighting
	tmux
)

source $ZSH/oh-my-zsh.sh

export ALIEN_SECTIONS_LEFT=(
  exit
  battery
  user
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)

export ALIEN_SECTIONS_RIGHT=(
  time
)

export ALIEN_THEME="bnw"

source ~/alien/alien.zsh

export EDITR="vim"

if [ -f '/home/omerk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/omerk/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/omerk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/omerk/google-cloud-sdk/completion.zsh.inc'; fi

# Compile server commands - start, stop & connect
alias startcs="gcloud compute instances start compile-server"
alias stopcs="gcloud compute instances stop compile-server"
alias cs="gcloud compute ssh compile-server"

# List all instances of specific executable
# For example: list_instances gedit | xargs kill
list_instances() {
	ps aux | grep $1 | grep -v grep | awk '{print $2}'
}
alias li=list_instances

# mkdir + cd into it
mkdir_cd() {
	mkdir $1
	cd $1
}
alias mkcd=mkdir_cd

if [ -z "$TMUX" ]
then
	    tmux attach -t m4gnumx || tmux new -s m4gnumx
fi

export COWPATH=$HOME/.cows:/usr/share/cowsay/cows

fpath=(~/.zsh/completion $fpath)

