# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
# enable root system
export LD_PRELOAD=/usr/lib64/libpng12.so.0.50.0
export ROOTSYS=~/usr/root-6.02.02
a=`echo $PATH|grep $ROOTSYS/bin:$HOME/bin`
if [ -z "$a" ];then
    export PATH=$PATH:$ROOTSYS/bin:$HOME/bin
fi
a=`echo $LD_LIBRARY_PATH|grep $ROOTSYS/lib`
if [ -z "$a" ];then
    export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
fi

# enable pyroot
a=`echo $PYTHONPATH|grep $ROOTSYS/lib`
if [ -z "$a" ];then
    export PYTHONPATH=$ROOTSYS/lib:$PATHONPATH
fi

# User specified aliases and functions
export PS1="\e[1;32mYanchu's_Command_Line: \e[m"
alias q=exit
alias e="/usr/bin/emacs -fs"
alias emacs="emacs -nw"
#alias quitx="gnome-session-quit"

# run fbterm if in a tty
iftty=`tty|grep tty`
if [ "$iftty" != '' ];then
    fbterm
fi

# hide input
#stty -echo

# run eterm in emacs
#eem=`ps ux|grep -v grep|grep emacs|awk '{print $9}'`
#if [ -z "$eem" ]; then
#    emacs -nw -f my-term
#else
#    time_eem=`echo $eem|awk '{print $NF}'`
#    time1=`date -d $time_eem +%s`
#    time2=`date +%s`
#    declare -i timedi=$(($time2-$time1))
#    if [ $timedi -gt 61 ];then
#	emacs -nw -f my-term
#   fi
#fi
