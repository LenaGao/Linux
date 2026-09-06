#!/bin/bash

上面这句话shibang指定了这个脚本的解释器是bash shell，注意不是sh shell
上面这句话不要省

#Author Zhen Gao (Email: zhen.gao@yahoo.com) # 注释

rate=$(df -h| grep "/dev/sd" | awk '{print $5}'| cut -d "%" -f1)
#get rate of using

echo $rate
if [ $rate -lt 20 ]
then
    echo "The system is healthy"
else
    echo "The disk is nearly fully, please take care"
fi
