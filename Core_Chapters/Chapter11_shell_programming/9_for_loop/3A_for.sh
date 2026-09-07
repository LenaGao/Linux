#!/bin/bash

#  这个是为了批量解压缩，因为local没有这么多压缩文件，做了修改
#  解压缩见3B

这个脚步体现了in类型的forloop的好处，
不需要指定循环次数，有几个文件循环几次


# cd ~/Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/Chapter11_shell_programming/9_for_loop
cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/9_for_loop
ls *.sh > ls.log
cat ls.log

# 请注意sh 结尾和bash 结尾的脚步不一样

y=1
for i in $(cat ls.log)
    do 
        echo $y $i
        echo $?
        y=$(( $y +1 ))
    done


rm -rf ls.log
