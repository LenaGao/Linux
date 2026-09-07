#!/bin/bash

# 脚本功能：备份/etc 目录，并把备份文件放在 /tmp/dbback 目录下

# echo $(date +%y%m%d) 
# 获取当前日期，格式为 年月日，
# 260906

# date=$(date +\%y\%m\%d)  # contab %有特殊含义，不能直接使用，需要用转义符\转义
date= $(date +%y%m%d) 
size=$(sudo du -sh /etc) # 获取 /etc 目录的大小（sudo 因为部分文件普通用户无权限读取）

echo $date
echo $size

# 判断备份目录 /tmp/dbback 是否已存在
if [ -d /tmp/dbback ] # 判断备份目录存在与否
    then
        # 目录已存在：直接在其中生成记录文件并打包
        echo "Date is $date" > /tmp/dbback/db.txt      # 记录备份日期
        echo "size is $size" >>/tmp/dbback/db.txt      # 记录 /etc 目录大小
        cd /tmp/dbback
        tar -zcf etc_$date.tar.gz /etc db.txt &>/dev/null        # 把/etc 和上面刚生成的db.txt 一起进行压缩
        #tar -zcf mysql-lib_$date.tar.gz /var/lib/mysql  &>/dev/null
        rm -rf /tmp/dbback/db.txt                      # 打包完成后删除临时的记录文件
    else
        # 目录不存在：先创建目录，再执行与上面相同的备份流程
        mkdir /tmp/dbback
        echo "Date is $date" > /tmp/dbback/db.txt
        echo "size is $size" >>/tmp/dbback/db.txt
        cd /tmp/dbback
        tar -zcf etc_$date.tar.gz /etc db.txt &>/dev/null
        rm -rf /tmp/dbback/db.txt
fi


# hard lnk 硬链接  ln 源文件 目标文件
# soft lnk 软链接 ln -s 源文件 目标文件