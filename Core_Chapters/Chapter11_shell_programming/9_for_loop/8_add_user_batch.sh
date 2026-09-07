#!/bin/bash
# add a group of user with specified amount
# Author Zhen Gao (zhen.gao@yahoo.com)

# 批量添加用户，但是用户名不能是自然ID或者真实姓名那样没什么明确规律，
# 这里时候结构完全一致，加上序列号的批量用户
# 这是给其他人用的

# 如果是自己添加用户，完全不需要判断用户名，密码，数量为空，我自己不会故意破坏自己的工作

# 1. 获取用户输入
read -p "Please input group user name: "               -t 30 name
read -p "Please input user num: "                      -t 30 num
read -p "Please input temporaty group user password: " -t 30 pass

# 2. 检查输入是否为空 (name, num, pass 都不为空)
# 美国变量都加了 ! , 也就是取反， 也就是都不为空
# 美国test 都加了 -a 表示需要同时成立
#if [ ! -z $name -a ! -z $num -a ! -z $pass ]; then # Both $name and "$name" works

if [ ! -z "$name" ] && [ ! -z "$num" ] && [ ! -z "$pass" ]; then  # this one much clear ======<<<<<<<<<<< 2026 Note:
    
    # 3. 验证 $num 是否为纯数字
    # sed 移除所有数字后，$y 应该为空 
    # 注意这个0 并不报错
    # ^[0-9]*$  更准确的写法应该是这个，以数字开头，以数字结尾， 数字的位数不限， 0不报错 2026　Note　
    y=$(echo "$num" | sed 's/[0-9]//g')

    if [ -z "$y" ]; then
        echo "Creating $num users named ${name}1 to ${name}${num}..."

        # 4. 使用正确的 Bash C 风格 for 循环
        for (( i = 1; i <= num; i++ )); do

            sudo useradd "$name$i" &> /dev/null #             # 加引号防止变量里有空格/通配符时被展开或分词
            echo "$pass" | sudo passwd --stdin "$name$i" &> /dev/null # 用 echo 管道传密码， "passwd --stdin " 接收输入（2026 修正）

        done
    fi
fi

# sudo bash 8_add_user_batch.sh 


