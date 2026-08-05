# manuel ， 命令和配置文件的帮助文档
man ls       # command 
man find     # command 
man services # configure file 
more services # configure file 
# man /etc/services      # NOT corret way, show whole file
man passwd       # default is cmd help
whereis passwd   # cmd and configure file location
man 1 passwd # cmd help
man 5 passwd # configure file help  

# short a line help
apropos passwd 
apropos inittab
whatis ifconfig

# --help general short than man
touch --help
help  --help

# bash build-in commands, such as cd, umask
man cd         # POSIX Programmer's Manual, more a file , q to quit 
info cd        # same as man cd 
help cd        # show help directly in bash GUI , no q needed! 
cd --help



date --help
whatis date
info date

which cd 
man ls
/-l search the option in the man page , n==> next match , down arrow key to next line , q==> quit
# man cd

date
man date 
man services # 配置文件帮助文档
man passwd   # 命令帮助文档 ， 既有命令又有配置危机，优先查看命令
man 1 passwd
man 5 passwd
# dnf install info
info date

data --help # BASH buildin command 
cd --help
umask --help
help umask 
help cd

cd --help
clear 

