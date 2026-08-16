#!/bin/bash

wc /etc/passwd
wc -l /etc/passwd
wc -w /etc/passwd
wc -m /etc/passwd

输入重定向 : < 
wc <  date

<< string  string  两个符号之间的内容作为输出
# 这里字符串的实例是 st, st 前后各出现一次，之间的内容才是真正的输入
wc << st
dadda
st



df -h | wc -l 


