
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "$TMUX" -a "$TERM_PROGRAM" != "vscode" -a "$(tty)" != "/dev/tty1" ] ; then
	echo "executed"
	TERMINAL_EMULATOR="$(basename $(tty))"
	TERMINAL_EMULATOR=${TERMINAL_EMULATOR^^} # Uppercase all letters

	TERMINAL_PROCESS="$(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))"

	if [ -x "$TERMINAL_PROCESS" ] ; then
		TERMINAL_EMULATOR=$(basename "$TERMINAL_PROCESS")
		TERMINAL_EMULATOR=${TERMINAL_EMULATOR^} # Uppercase first letter
	fi

	for i in $(seq -w 1 100) ; do
		if [ "$i" -eq 001 ] ; then
			SESSION_NAME="$TERMINAL_EMULATOR"
		else
			SESSION_NAME="$TERMINAL_EMULATOR-$i"
		fi

		if (exec tmux new -s "$SESSION_NAME") ; then
			break
		fi
	done
fi

### pars for fun: install | remove | rollback
function apt-history(){

      case "$1" in
        install)
              grep 'install ' /var/log/dpkg.log
              ;;
        upgrade|remove)
              grep  /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | \
                  grep "" -A10000000 | \
                  grep "" -B10000000 | \
                  awk '{print "="}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

neofetch 

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
