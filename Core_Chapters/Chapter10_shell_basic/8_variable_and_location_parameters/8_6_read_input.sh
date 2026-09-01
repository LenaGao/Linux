#!/bin/bash 
# Auther Lena Gao Email Lena-gao@hotmail.com

read -t 30 -p "Pleasne input your name: " name
echo " Name is  $name " 

read -s -t 30 -p "Pleasne input your age: " age # 年龄是隐身，故用 -s 隐藏
echo " Age is  $age " 

read -n 1 -t 30 -p "Pleasne input your gender [M/F]: " gender # -n 1 只接受一个字符就执行
echo " Gender is  $gender " 




# bashbash 8_3C_bash_positional_parameter 12 23 44 56 88 77 
#  A total of 8 parameters 
#  The parameters is 11 22 33 44 55 66 77 88
#  The parameters is 11 22 33 44 55 66 77 88