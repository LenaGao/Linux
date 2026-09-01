#!/bin/bash

echo "The PID of the current process is  $$ "

find /home/lena -name hellp.sh &     # &  符号就是放入后台执行
echo "The PID of the last background process is  $! "



# $?  上一条命令的返回状态，0 表示正确， $$  和 || 就是取这个值  <<================
# $$  当前进程进程好
# $!  后台运行的最后一个进程的进程号

# find /home/gao  -name zhengao  & 
# &  background run
# nohup : logout 不影响继续执行 

# bash 8_4B_more_set1.sh 
# The PID of the current process is  18653 
# The PID of the last background process is  18654 