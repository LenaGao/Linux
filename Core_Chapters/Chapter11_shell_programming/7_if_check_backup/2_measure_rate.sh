#!/bin/bash

上面这句话shibang指定了这个脚本的解释器是bash shell，注意不是sh shell, 
bash shell是sh shell的一个增强版本，支持更多的功能和特性。
上面这句话不要省,
各种语言的脚步基本上都可以看见第一行是这一句

#Author Zhen Gao (Email: zhen.gao@yahoo.com) # 注释

rate=$(df -h| grep "/dev/sd" | awk '{print $5}'| cut -d "%" -f1)
# get rate of using
一定要去除百分号的原因是，
bash 数值大小判断只能是纯数字 

echo $rate
if [ $rate -lt 20 ]
    then
        echo "The system is healthy"
    else
        echo "The disk is nearly fully, please take care"
fi
