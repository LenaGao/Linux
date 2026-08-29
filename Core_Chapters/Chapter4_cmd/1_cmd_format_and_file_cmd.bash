#### 文件处理命令
#! /home/lena/bash 
# cmd [-option] [parameters]     
# 选项： 调整功能，
# 参数： 操作的对象，比如： 用户，进程，文件，目录等

# ls => list
ls -la /etc 
# option can be used together -al == -al = -l -a
# option has simplified and full format 简化选项完整选项
-a == --all

# ls -la /etc
# total 892
# drwxr-xr-x 93 root root       4096 Jul 30 11:24 .
# drwxr-xr-x 27 root root       4096 Jul 30 11:24 ..
# -rw-r--r--  1 root root       3444 Jul  5  2023 adduser.conf
# drwxr-xr-x  2 root root       4096 Jul 22 18:11 alternatives

# -rwxr--rw-
# u g o 
# user group other
# 所有者，所属组，其他人 
- d l 文件，目录，软连接(字符设备文件，块设备文件)  
r read   w write  x execute   - no permission 
哪怕是所有者，默认权限没有 x ，也不能执行，必须 chmod +x 才能执行 

inode number  每个文件都有一个 inode number ，
inode 节点 是文件的唯一标识符，inode number 记录了文件的元数据（metadata），
包括文件类型、权限、所有者、大小、创建时间、修改时间等信息。inode number 不包含文件名和路径信息，
文件名和路径信息存储在目录项中。inode number 是文件系统内部使用的标识符，用于快速定位文件数据块。

ls -l -a -h -d -i
lla
ld # ls -ld */  -d 让 ls 本身列出目录条目（而不是目录内容） */ 是 shell 通配符，只匹配目录

make directory 
生成目录（文件夹） ， 目录结构应该事先规划好，避免重复创建目录，浪费空间
mkdir ./tmp/
mkdir ./tmp/Japan/boduo
mkdir -p ./tmp/Japan/boduo # mkdir recursively and touch a file  递归创建
mkdir ./tmp/Japan/longze  ./tmp/Japan/cangjing

# some -p , some -r 
mkdir -p ./tmp/tmp3_ZG/3rd_level_dir/f  && touch ./tmp/tmp3_ZG/3rd_level_dir/file.txt 
# cp -r tmp/tmp3_ZG/    tmp/tmp1_ZG/     # recursive 
llh ./tmp/tmp3_ZG/
ll ./tmp/tmp3_ZG/3rd_level_dir/file.txt


# change directory

cd 
cd ..
cd ../..
cd /tmp/tmp3_ZG/
cd -

# print working directory
pwd

.
..


# remove directory 仅能删除空目录，不能删除非空目录
rmdir tmp # delete blank dir
rmdir tmp1

rm -r tmp/tmp1_ZG                          # -r  recursive 

mkdir  tmp/tmp1_ZG/3rd_level_dir_1/   
cp  -r  tmp/tmp1_ZG/3rd_level_dir/    tmp/tmp/3rd_level_dir_renamed # copy and rename
# -r keep file time etc
# -p keep timestamp

clear # Ctrl + l

# move and rename 
mv  tmp/tmp/3rd_level_dir_renamed   tmp/tmp1_ZG

# cp copy file or directory
cp -r tmp/tmp1_ZG     tmp/tmp2_ZG     # 复制目录
rm -rf tmp/tmp2_ZG    
# -f # 强制删除，且不提示
# -r # 递归删除目录及其内容 
# -p # 保存文件属性  
#    # 可以复制同时更名

# move mv 剪切和更名
cp snap snap0 
cp snap snap1 
cp snap snap3  
cp snap snap4  
mv snap snap2

# 绝对路径和相对路径
# 绝对路径：从根目录开始的完整路径
# 相对路径：相对于当前工作目录的路径 

#rm  remove file or directory
# linux rm 命令用于删除文件和目录。它可以删除单个文件、多个文件或整个目录及其内容。
# 使用 rm 命令时要小心，因为删除的文件通常无法恢复。
# Linux 并无回收站，
# 无法恢复被删除的文件，除非使用特殊工具或备份。
# Linux rm 命令的基本语法如下：
rm snap0
rm -f snap1 # force 删除，不提示, 强制删除文件或目录，即使它们是只读的。
rm -r snap1 # force 删除，不提示, 强制删除文件或目录，即使它们是只读的。
rm -rf snap1 # force 删除，不提示, 强制删除文件或目录，即使它们是只读的。

# 一旦误删除，尽量减少对磁盘的写入操作，避免覆盖被删除文件的数据块。
# 然后可以尝试使用数据恢复工具（如 TestDisk、PhotoRec 等）
# 来扫描磁盘并恢复被删除的文件。





#### 文件处理命令
# 如果没有路径，默认在当前目录下创建文件
# 除了/ forward slash 不能作为文件名，其他符号都可以作为文件名.
# 严重不推荐文件名包含空格，空格会导致很多麻烦，尤其是 shell 脚本中，空格会被当作分隔符，导致命令解析错误。

touch ./tmp/story.list
cd ./tmp
touch shencao girl
touch "shencao girl" # dot NOT use Space , troublesome 

# 显示文件内容
cat /etc/issue
cat -n /etc/issue # 显示行号

cat /etc/services
tac /etc/services # reverse

more /etc/services # page arrow down  or space  a page , enter a line 
less /etc/services # page arrow down  or space # less is more
# /keyword  search , n   next-match
# 在浏览状态 q : quit , 退出
# Page up / Page down  , 上下翻页
# Up / Down  , 上下翻行
# / "key word"  ==> search ,   n   next-match

head /etc/services # -n : n line , 查看文件的前 n 行，默认 10 行
tail -n 3 /etc/services #  查看文件的最后 n 行，默认 10 行
tail -f /var/log/syslog # 实时查看文件内容，常用于监控

mkdir  /home/lena/tmp/
cp /etc/services  /home/lena/tmp/
# touch -p tmp/services


# ln -s 软连接，类似于 Windows 的快捷方式    <<<<< =====
ln -s /home/lena/tmp/services service_link # ln 源文件 软连接
# ln 硬连接，两个文件共享一个inode number，硬连接是指向同一个文件的不同目录项，
# 删除其中一个不会影响另一个
ln /home/lena/tmp/services service_hard
ls -l

ls -l
total 40

# 软连接的特点
# 1) 软连接是一个独立的文件，包含指向目标文件的路径信息，而硬连接是指向同一个 inode 的不同目录项。
# 2) 软连接可以跨文件系统，而硬连接不能跨文件系统。
# 3) 删除软连接不会影响目标文件，而删除硬连接会影响目标文件的引用计数，可能导致文件被删除。
# 4）软连接可以指向目录，而硬连接不能指向目录。
# 5）软连接极小
# 6）软连接有 “l” 标注
# 7）软链接有明确的箭头标志

-rw-r--r-- 1 lena lena   338 Jul 29 10:37 AGENTS.md
drwxr-xr-x 6 lena lena  4096 Jul 29 17:58 All_Tricks
drwxr-xr-x 7 lena lena  4096 Jul 29 20:31 Linux
drwxr-xr-x 3 lena lena  4096 Jul 22 22:42 Linux_and_Cluster_for_Omics-master
# lrwxrwxrwx 1 lena lena    23 Jul 31 20:57 service_link -> /home/lena/tmp/services # ->    =======
# EVRY Special !!!! 
# lrwxrwxrwx
# very tiny 23 bytes  

# 删除软连接的时候有一个时需要高度注意 
# rm  service_link  # 只删除软连接本身，不会影响原文件
# rm  service_link/  # 删除原文件夹！ ，非常危险，
# rm  service_link/  会删除原文件夹及其内容，因为 service_link 是一个指向 /home/lena/tmp/services 的软连接，
# 使用 rm service_link/ 会被解释为删除 /home/lena/tmp/services 目录及其内容。

# 硬链接的特点： 
# 1)最大特点同步更新
# 2) 硬链接删除一个文件，另一个文件仍然存在，且内容不变
# 3) 硬链接不能跨分区，不能对目录使用
# 硬链接不能针对目录使用，因为目录的硬链接可能会导致文件系统结构混乱，破坏文件系统的一致性和完整性。

# ls -l services_hard
-rw-r--r-- 2 lena lena 12813 Jul 31 20:57 service_hard
#ls -l /home/lena/tmp/services
-rw-r--r-- 2 lena lena 12813 Jul 31 20:57 /home/lena/tmp/services

# NOTE: Every detail of the file is the same, except the inode number and file name, 
# which is different for hard links.
echo "The experiments from Lena" >> service_hard
cat home/lena/tmp/services


drwx------ 3 lena lena  4096 Jul 29 18:22 snap
drwxr-xr-x 2 lena lena  4096 Jul 31 20:57 tmp


ls -i /home/lena/tmp/services 
ls -i service_link
ls -i service_hard
ls -il service_link
ls -il service_hard

echo "www.lampbrother.com" /home/lena/tmp/services service_hard

# difference between hardlink  and cp -p  , can keep updating
# hard ln cannot cross partion  不能跨分区，
# 硬连接不能对目录使用

# 权限更改命令
chmod u+x file_name  # 给文件所有者添加执行权限
chmod g-w file_name  # 移除文件所属组的写权限
chmod o+r file_name  # 给其他用户添加读权限
chmod a+r file_name  # 给所有用户添加读权限
chmod g=rwx file_name  # 给文件所属组设置读、写、执行权限
chmod 755 file_name   # 设置文件权限为 rwxr-xr-x
chmod -R 755 dir  # 给目录及其子目录和文件设置权限为 rwxr-xr-x

r --- 4
w --- 2
x --- 1

rwx --- 7
r-x --- 5
rw- --- 6
r-- --- 4

rwxrw-r--  764

532
r-x-wx-w-  按照数字表示写出权限位表示


文件的权限
r 是 允许查看文件内容 cat/less/more/tail
w 是 允许修改文件内容 vi/nano/gedit 
x 是 允许执行文件 ./file_name 程序，脚本，命令



目录的权限和文件完全不一样
r 是 允许查看目录内容 ls
w 是 允许在目录中创建、删除文件 touch，rm rmdir, mkdir
x 是 允许进入目录 cd 

尽管文件是root 用户创建的，但如果目录设置为777，其他用户也可以在该目录下创建、删除文件，
因为目录的权限决定了对目录内容的操作权限，而不是文件本身的权限。
删除文件的条件是对文件所在目录有写权限，而不是对文件本身有写权限。<< ============

所以对目录，rx成对权限是必须，运行进入和查看目录内容，
w是对目录内容的操作权限，删除文件的条件是对文件所在目录有写权限，而不是对文件本身有写权限。

# 权限管理命令
# 只有文件所有者或者 root 用户才能修改文件的权限。
# 只有 root 用户才能修改文件的所有者。


useradd # 添加用户
groupadd # 添加组

chown # 改变文件或目录的所有者和所属组.
# 只有 root 用户才能使用 chown 命令改变文件的所有者和所属组。
# 文件所有者不可以改变文件的所有者，但可以使用 chown 命令改变文件的所属组。
 
chown user:group file_name  # 改变文件的所有者和所属组
chown -R user:group dir  # 递归改变目录及其子目录

cd home/lena/snap
touch abcd

chown root abcd
chown zhen abcd



lena@DESKTOP-C8OKE65 $ chown root abcd
chown: changing ownership of 'abcd': Operation not permitted
[21:19:06] [/home/lena/snap]:
lena@DESKTOP-C8OKE65 $ chown zhen abcd
chown: changing ownership of 'abcd': Operation not permitted

sudo chown root abcd
sudo chown zhen abcd

chgrp # 改变文件或目录的所属组
chgrp group_name file_name  # 改变文件的所属组
chgrp lampbrother abcd

文件创建着就是所有者
文件的所属组是创建者的默认组，除非使用 chgrp 或 chown 改变。
每个用户只能有一个默认组，但可以属于多个组。用户的默认组通常与用户名相同。
默认组也叫 primary group 和 缺省组，其他组叫 secondary group。

umask # 设置默认权限（缺省权限又叫掩码） 
# 0022 
# 1st 0  特殊权限位， 0 表示没有特殊权限，2 表示去掉写权限， 2 表示去掉写权限
# then 022  755-022 = 755    
umask -S 
# u=rwx,g=rx,o=rx

cd  (cd ~)  # 回到用户的 home 目录
mkdir lamp
touch fanbingbing

ls 

if I want to set rwxt-xr--  754
777-754 = 023

umask 
# 023

umask 022
