格式化输出命令
printf   '输出类型 和 输出格式'  输出内容
# for awk  <<< ====

# print also works for awk, and add  \n automatically
# but linux has no print.

# %ns  输出字符串， n： 几个字符
# %ni  输出整数， n： 几个数字
# %m.nf  输出浮点数， m:总共几个位数 n：几个小数位数， %8.2 ：6位整数，2位小数

# \n 换行
# \r 回车
# \t 制表符  

# cd Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/Chapter11_shell_programming/

cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/2_column_extract_cut_and_printf/

printf %s  1 2 3 4 5 6  
printf %s %s %s  1 2 3 4 5 6       # 注意没有引号， 故只有第一个符合其了作用，后面的都变成输出内容了
printf '%s %s %s'  1 2 3 4 5 6     # 注意有引号 
printf '%s %s %s\n'  1 2 3 4 5 6   # 注意换行符

printf %s  ../data/studeng.txt         # only print string of the input  
cat   ../data/student.txt  | printf %s # Still Don't Work 

printf %s  $(cat ../data/student.txt)  #   Works ， 
但是格式极其糟糕

printf '%s\t %s\t %s\t %s\t %s\t %s\t\n' $(cat ../data/student.txt)  #   Works ，格式很好，但是不够灵活， 
只能输出6列， 不能输出7列，8列等
且过分复杂

所有在真实编程中，printf命令的使用，都是结合cut命令或者awk命令来使用的， 
以达到灵活输出的目的。
基本上不存在单独使用printf命令的情况。

awk 命令中支持print 和printf 两个命令， 
但Linux系统中没有print命令， 但是awk中有print命令，

printf 是格式化输出命令，
printf 不会自动换行
print 是简单输出命令， 
print 会自动换行，