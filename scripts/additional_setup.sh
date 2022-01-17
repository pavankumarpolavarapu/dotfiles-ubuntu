#!/usr/bin/bash
# Nitrogen Configuration for Reloading Wallpaper on Boot
sudo echo "@reboot pavankumarp /usr/bin/nitrogen --set-zoom-fill --random /home/pavankumarp/Pictures/wallpaper --save" >> /etc/crontab

# NUMA Error for Cuda
sudo echo "@reboot root for a in /sys/bus/pci/devices/*; do echo 0 | tee -a $a/numa_node; done > /dev/null" >> /etc/crontab


# Appending Things to .bashrc
if [ ! -f "$HOME/.bashrc" ]
then
        echo "executing cat"
        cat <<EOF >> $HOME/.bashrc
# If not running interactively, don't do anything
[[ \$- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\\u@\\h \\W]\\\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -z "\$TMUX" -a "\$TERM_PROGRAM" != "vscode" -a "\$(tty)" != "/dev/tty1" ] ; then
        echo "executed"
        TERMINAL_EMULATOR="\$(basename \$(tty))"
        TERMINAL_EMULATOR=\${TERMINAL_EMULATOR^^} # Uppercase all letters

        TERMINAL_PROCESS="\$(ps -o 'cmd=' -p \$(ps -o 'ppid=' -p \$\$))"

        if [ -x "\$TERMINAL_PROCESS" ] ; then
                TERMINAL_EMULATOR=\$(basename "\$TERMINAL_PROCESS")
                TERMINAL_EMULATOR=\${TERMINAL_EMULATOR^} # Uppercase first letter
        fi

        for i in \$(seq -w 1 100) ; do
                if [ "\$i" -eq 001 ] ; then
                        SESSION_NAME="\$TERMINAL_EMULATOR"
                else
                        SESSION_NAME="\$TERMINAL_EMULATOR-\$i"
                fi

                if (exec tmux new -s "\$SESSION_NAME") ; then
                        break
                fi
        done
fi

### pars for fun: install | remove | rollback
function apt-history(){

      case "\$1" in
        install)
              grep 'install ' /var/log/dpkg.log
              ;;
        upgrade|remove)
              grep $1 /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | \\
                  grep "$2" -A10000000 | \\
                  grep "$3" -B10000000 | \\
                  awk '{print $4"="$5}'
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

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


## Begin of Path Variables
# Uncomment once yarn is installed using nvm
#export PATH=$PATH:"$(yarn global bin)"
## End of Path Variables

## Aliases
export WINDOWS="/media/pavankumarp/B6C651B8C6517A17/Users/pavan/Documents/Workspace"

# Not completely updated the scripts for below execution
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


cd () {
    if builtin cd ${1:+"$@"} && [ -r ./.venv/bin/activate ]; then
        . .venv/bin/activate
    fi
}

export HISTTIMEFORMAT='%F, %T '
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups

EOF
fi
