# /dev/stdin   文件描述符: 0 ==> 键盘：标准输入设备
# /dev/stdout  文件描述符: 1 ==> 显示器：标准输出设备
# /dev/stderr  文件描述符: 2 ==> 显示器：标准错误输出设备

输入输出重定向
输入输出不再到标准设备，而是其他设备，这里是文件

cmd > file     # 覆盖写入， 命令必须有输出才行
cmd >> file    # 追加写入

lla >> ls_err
date > abc
date >> abc

cat abc
cat ls_err


lls 2>> ls_err # 如果要文件保存错误信息，必须在>之前有2 
cat ls_err  
lls 2 >> ls_err # 2 和 > 不能有空格 

# 必须知道是错误输出才能
stderr 2> file   # 
stderr 2>> file  # no space 


所有现实工作，不存在预判故意写入错误命令，并保存
而是把一切输出都保持到特点文件

cmd >  file 2>&1 # all normal and err  to file  ，把错误输出加入正确输出 2>&1, 然后把所有输出写入某文件 
cmd >> file 2>&1 # all normal and err append to file 

# 当代以下两种为主流
cmd &>  file     # all normal and err to file 
cmd &>> file     # all normal and err append to file 

ls &> /dev/null # 这个是垃圾箱

这是分别保存正确错误输出的正确方法
# this , we need only file2 to check error message ，这个是正确错误分开 ！
cmd >> file1 2>> file2  # normal append to file1 while err append to file2


