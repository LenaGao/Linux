#!/bin/bash
# cut ,awk 都是显示结果

sed 是流编辑器，可以直接修改文件
实际应用是打印一些行， 并不修改原文件
也就是在不修改文件的情况下，
打印出想要的行，
或者对打印的行进行一些处理， 比如替换，删除，插入等操作
vim 这种常规编辑器是直接修改文件的， sed 是流编辑器， 只处理打印的行，不修改原文件

cat ../data/student1.txt

# 默认输出所有数据， p 打印 (也就是输出) # 也就是输出第二行， 也就是打印第二行
sed '2p' ../data/student1.txt  

但是很不好，除了第二行 还加上默认输出所有数据， 
也就是打印了两次第二行， 所以要加上 -n 选项


# -n option， 则只有处理的行输出到屏幕, 第一行包含标题行
绝大多数情况下， -n 和p 联合使用

sed -n '2p' ../data/student1.txt


# 删除动作 d   del from line 2 to line 4 
sed  '2,4d' ../data/student1.txt
cat ../data/student1.txt

可见原文件没有被修改， sed 只是打印了删除后的结果，并没有修改原文件

# 追加动作 a -append option , 在某行之后
sed '2a hello' ../data/student1.txt

# 插入动作 i -insert option ， 在某行之前
sed '2i hello' ../data/student1.txt

# 插入动作 i -insert option ，  允许多行， 但需要加上 '\' 续行符， 并在终端分两行输入
# sed '2i hello \   
# canglaos'  ../data/student1.txt
# 以上要在终端分两行输入


替换一行的动作 c : replace a line 
sed '4c no such person' ../data/student1.txt

替换一个字符串动作 s replace a string
sed '4s/99/55/g' ../data/student1.txt  

把他的第四行的 99 替换成 55， 
g 表示全局替换， 
如果不加 g 
则只替换第一次出现的 99

#'-i' for write in the documents  
修改输出的同时还直接修改原数据, 有危险！！ # <<=====

cat ../data/studentForSed_back.txt

sed -i '5s/99/55/g' ../data/studentForSed_back.txt

# 动作 i 和 选项 -i 完全不同， i 是插入， -i是原地修改 
# 如果真要修改，用vim 或者vscode 修改，稳妥的多

如果要修改原文件，最好先备份原文件， sed -i 直接修改原文件，危险性大
更好的实际上还是用vim vscode 或者 positron IDE 修改，稳妥的多

选项实际上就三个: -n  -i -e (多动作同时执行)
# -e mutiple replace togethers
sed -e 's/Zhen//g;s/xiao//g' ../data/studentForSed.txt

#'\' means another line
sed '2i hello \
world' ../data/student1.txt

#replace a string
#replace a string in whole documents  

