#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

read -t 300 -p "Please input a filename: " file # file 是输入的接收变量
# 接收键盘的输入，并赋予变量 file

echo $file
if [ -z $file  ]
then
    echo "Error, Your didn't input a filename "
    exit 1
elif [ ! -e $file ]    # -e file 如果是文件，取反 == >> 即如果不是文件
then
    echo "Your input is NOT a filename "
    exit 2
elif [ -f $file ]    
then
    echo "Your input is a regular filename "
elif [ -d $file ]    
then
    echo "Your input is a directory "

else
    echo "The $file is an other type of file"
fi

# Please input a filename: /home/gao/testfile.bz2