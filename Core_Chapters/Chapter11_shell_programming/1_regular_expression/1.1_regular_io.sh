#!/bin/sh

通配符和正则表达式的区别：
# Bash 中
通配符/globbing   (1)是搜索文件名的， (2)是精确匹配
正则表达式(Regular Expression /re)   (1)搜索文件中的字符串(string)的， (2)是包含匹配

# grep awk sed  可以支持 re 
# ls find cp      不支持正则表达式，只能使用shell自己的通配符(globbing), 要完全匹配 

其他语言正则和通配符不一定有严格区分

# Bash 中的严格区别本质上来源于 ls find 等命令不支持正则
# 表观上造成通配符搜索文件名， re搜索字符串

教学文件路径：
/home/lena/Linux/Core_Chapters/Chapter11_shell_programming/data/test_rule.txt

* 通配符中指任意字符出现任意次， 包含0次， 也就是没有字符
? 任意单个字符 ， 注意这是 shell globbing 的通配符， 不是正则表达式的通配符 
[] 括号内的任意一个字符


## Regular Expression
*    正则中是前一个字符出现任意次， 包含0次， 也就是没有这个字符
.    任意单个字符 ， 注意这是正则表达式的通配符， 不是 shell globbing 的通配符
.*   任意字符任意多次   # 等同于globbing 中的 *
[] 括号内的任意一个字符

# ^ 行首
# $ 行尾
# [^] 取反, 括号内字符之外的任意一个字符

# \  转义符，用于取消后一个特殊字符的特殊含义，使其变为普通字符
# \{n\}   前面的字符恰好n次
# \{n,\}  前面的字符大于等于n次
# \{n,m\} 前面的字符大于等于n次， 小于等于m次


grep "a*" /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/data/test_rule.txt

pwd
cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/1_regular_expression
grep "a*" ../data/test_rule.txt
# 列出了所有行， 也包括没有a的行， 因为*表示前一个字符出现任意次， 包括0次

grep "aa*" ../data/test_rule.txt
# 列出了所有包括a的行， 因为*表示前一个字符出现任意次， 包括0次


grep "^a*" ../data/test_rule.txt
# 列出了所有以a开头的行， 也包括没有a的行， 因为*表示前一个字符出现任意次， 包括0次



dir='thsi is v1'
dir1=/Mathematics/Guests/goodegg
dir2=`pwd`
declare -a arr1
arr1[0]=234
arr1[1]=334
arr1[2]=5234
arr1[3]=234
arr1[4]=12234
declare -a arr2
arr2=(9 4 8 3)
echo -n"enter your name"
read Name
echo "Hello $Name"
ls $dir1
echo $dir
cat $dir1/cprog/105.c
echo $dir2
echo $(pwd)
echo ${arr1[4]}
echo ${arr2[2]}
echo ${arr1[*]}
echo ${arr2[@]}
read name
read a b c
echo $name
echo $a $b $c

