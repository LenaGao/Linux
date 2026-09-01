#!/bin/bash
ls 
echo $?

lsdsg 
echo $?
# 127, 这是写Linux bash 的作者，在没命令找不到的时候，指定报错数字是127
# 作者自己定义，不为0 即可，因为0 表示正常执行

ls jibegg 
echo $?
# 2, 这是写Linux bash 的作者，在没文件找不到的时候，指定报错数字是2
# 作者自己定义，不为0 即可，因为0 表示正常执行



# $?  上一条命令的返回状态，0 表示正确， $$  和 || 就是取这个值  <<================


# $$  当前进程进程号 PID
# $!  后台运行的最后一个进程的进程号 PID

# find /home/gao  -name zhengao  & 
# &  background run
# nohup : logout 不影响继续执行 

# chmod 755 8_4_more_set1.sh
# ./8_4_more_set1.sh 11 22 33 44 55 66 7777 8888
# ./8_4_more_set1.sh 11 22 33 44 55 66 
# ./8_4_more_set1.sh 22 33 44 55 66 7777
# ./8_4_more_set1.sh 55 66 7777 8888
# 4 0 20723 55 66 7777 8888