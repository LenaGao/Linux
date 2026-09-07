#!/bin/bash
# add a group of user with specified amount
# Author Zhen Gao (zhen.gao@yahoo.com)

# 如果是自己添加用户，完全不需要判断用户名，密码，数量为空，我自己不会故意破坏自己的工作

# 1. 获取用户输入
read -p "Please input group user name: "               -t 30 name
read -p "Please input user num: "                      -t 30 num
read -p "Please input temporaty group user password: " -t 30 pass

# 2. 检查输入是否为空 (name, num, pass 都不为空)
# 变量都加了 ! , 也就是取反， 也就是都不为空

if [ ! -z "$name" ] && [ ! -z "$num" ] && [ ! -z "$pass" ]; then        # this one much clear ======<<<<<<<<<<< 2026 Note:
    echo "Creating $num users named ${name}1 to ${name}${num}..."
    # 4. 使用正确的 Bash C 风格 for 循环
    for (( i = 1; i <= num; i++ )); do
        useradd "$name$i" &> /dev/null #                          # 加引号防止变量里有空格/通配符时被展开或分词
        echo "$pass" | sudo passwd --stdin "$name$i" &> /dev/null      # 用 echo 管道传密码， "passwd --stdin " 接收输入（2026 修正）

    done

fi

# sudo bash 8_add_user_batch.sh , 调用的时候sudo 即可 << ==


