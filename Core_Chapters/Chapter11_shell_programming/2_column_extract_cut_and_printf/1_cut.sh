# 提取字符串
# cat ../data/student1.txt # 分割符必须是tab ， 不能是空格
# 实际上除了空白作为分割，有tab， ， ：等分隔符的， 尽量用cut
# 选项
 -f 2 # 提取第二列, 默认只能是tab (制表符) 作为分隔符
 -d : # 指定分隔符为冒号

cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/2_column_extract_cut_and_printf/
cut -f 1 ../data/stu.txt 
cut -f 2 ../data/stu.txt 
cut -f 3 ../data/stu.txt 
cut -f 2,3  ../data/stu.txt  # 提取第2列和第3列， 用逗号分隔

以下命令会失败
cut -d " " -f 2 ../data/student1.txt 

# 以下是提取/etc/passwd文件的第1列和第3列， 以冒号作为分隔符， 次序无区别
cut -d ":" -f 1,3 /etc/passwd 
cut -f 1,3  -d ":" /etc/passwd 


# cut are used in pipeline， cut 正常会和grep合用来提取符合条件的列， 也可以和awk合用来提取符合条件的列
# find all users ===
cat /etc/passwd 

通过管道符接收前一个命令的输出， 然后用grep提取符合条件的行， 然后用cut提取符合条件的列

cat /etc/passwd | grep /bin/bash | grep -v root # 发现所有用户， 但是不包括root用户
cat /etc/passwd | grep /bin/bash | grep -v root |  cut -d ":" -f 1

cut 的局限
# cut 对空格无效
df -h  
df -h  | grep "sdd"
df -h  | grep "/dev/sdd" | cut -f 5 
df -h  | grep "/dev/sdd" | cut  -d "%" -f 1 
# df -h  | grep "/mnt/wslg" | cut -f 5 
# df -h  | grep "/mnt/wslg" | cut  -d "%" -f 1 

cut 只对tab有效， 或者具体的分割符， 比如“：”，  但对空格无效， 

但是awk对空格有效， 所以awk比cut更强大
叫awk 编程
