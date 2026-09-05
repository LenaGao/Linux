#!/bin/bash
cat ../data/student.txt

sort ../data/student.txt
sort -r  ../data/student.txt # reverse

# -i ignore case 忽略大小写

cat /etc/passwd # 注意root 是第一个

sort /etc/passwd

# use 3rd items for ranking， 
从第三个字段开始，到第三个字段结束
也就是用第三个字段进行排序， 也就是按用户id排序， 也就是按数字排序
# alphabettal ranking as a string
sort -t ':' -k 3,3 /etc/passwd  

10 在2 前面


# use 3rd items for ranking

'-n' for numeriical ranking

sort  -n -t ':' -k 3,3 /etc/passwd
这里就可以看到 1-2-9 到 10，2  



计数

wc  
wc -l  # 行， 仅统计行数
wc -w  # 单词数目
wc -m  # 字符

# 不给选项，默认统计全部： 行数，单词数目，字符数目
df -h |wc 