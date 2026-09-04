#!/bin/bash
# Please use print  NOT printf
# BEGIN work an action in {},         before line opertatin
# specify seperator
cat /etc/passwd | grep "/bin/bash" | awk '{printf  $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $7 "\n" }' 

cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/3_awk
cat ../data/student_science_courses.txt
cat ../data/student_science_courses.txt | grep -v Name 
cat ../data/student_science_courses.txt | grep -v Name | awk  '$3>=87 {print  $1 }'

关系运算符
cat ../data/student_science_courses.txt | awk '$3>=87 {print  $1 "\t" $2 "\t" $3}' 
cat ../data/student_science_courses.txt | grep -v Name | awk  '$3>=87 {print  $1 "\t" $2 "\t" $3}' 


新学习者其实都可以用bash 语言进行条件判断，不需要awk 语言进行条件判断，


awk 语言的条件判断是为了在处理文本文件时，能够快速的筛选出符合条件的行。

也就是新人尽量逻辑简单，代码可以长一点

熟练以后再使用awk 语言进行条件判断，代码可以短一点