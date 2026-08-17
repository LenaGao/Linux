#!/bin/bash

wc /etc/passwd
wc -l /etc/passwd
wc -w /etc/passwd
wc -m /etc/passwd


输入重定向 : < 
wc <  date

输入重定向之 "<<" , 更罕见，这里作为知识介绍:  

<< string  string  两个字符串(string)之间的内容作为输出
# 这里字符串的实例是 st, st 前后各出现一次，之间的内容才是真正的输入
wc << st
dadda
st



df -h | wc -l 


