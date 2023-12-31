# ~/.bashrc: executed by bash(1) for non-login interactive shells.

export PATH=\
/bin:\
/sbin:\
/usr/bin:\
/usr/sbin:\
/usr/bin/X11:\
/usr/local/bin

# If running interactively, then:
if [ "$PS1" ]; then

    if [ "$BASH" ]; then
	export PS1="\h[\W]\$ "
    else
      if [ "`id -u`" -eq 0 ]; then 
	export PS1='# '
      else
	export PS1='$ '
      fi
    fi

    export USER=`id -un`
    export LOGNAME=$USER
    export HOSTNAME=`/bin/hostname`
    export HISTSIZE=1000
    export HISTFILESIZE=1000
    export PAGER='/bin/more '
    export EDITOR='/bin/vi'
    export INPUTRC=/etc/inputrc
    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile

    ### Some aliases
    alias ps2='ps facux '
    alias ps1='ps faxo "%U %t %p %a" '
    alias af='ps af'
    alias cls='clear'
    alias ll='/bin/ls -laFh'
    alias ls='/bin/ls -F'
    alias df='df -h'
    alias indent='indent -bad -bap -bbo -nbc -br -brs -c33 -cd33 -ncdb -ce -ci4 -cli0 -cp33 -cs -d0 -di1 -nfc1 -nfca -hnl -i4 -ip0 -l75 -lp -npcs -npsl -nsc -nsob -nss -ts4 '
    #alias bc='bc -l'
    alias minicom='minicom -c on'
    alias calc='calc -Cd '
    alias bc='calc -Cd '
fi;
