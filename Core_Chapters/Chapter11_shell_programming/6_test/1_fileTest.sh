#!/bon/bash
# 文件性质测试

cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/6_test


# test 有两种形式， 一种用 test 关键字， 一种用 []
第一种，人操作更直观，
判断文件是否存在
test -e ../data/student.txt # 无显示值
echo $?  
0 # means no error
以上正确执行了

第二种，计算机更容易理解，也是bash自动化执行的主流，因为机器更容易理解 [] 这种形式

[ -e ../data/student.txt ] # 无显示值
echo $?  
也正确执行了


test -e /etc/passwd 


真实代码往往判断之后根据前已经判断的结果的真假，做不同的处理， 类似 if else 语句
-e 文件存在
-d 文件存在
-f 文件存在且可读
-w 文件存在且可写
-x 文件存在且可执行


[ -e /etc/passwd ]
[ -e /etc/passwd ] && echo "yes, it's exist" || echo no
可以看到"yes, it's exist" 
[ -w student.txt ] && echo "yes, it's exist and writable" || echo "no"
[ -w student.txt ] && echo "yes, it's exist and writable" || echo no

可以看到开头的""no, it's not exist or not writable""



