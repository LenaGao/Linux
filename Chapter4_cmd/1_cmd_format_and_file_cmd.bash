#! /home/gao/bash 
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
mv snap snap2

# 绝对路径和相对路径
# 绝对路径：从根目录开始的完整路径
# 相对路径：相对于当前工作目录的路径 

#rm  remove file or directory
rm snap0
rm -f snap1


touch ./tmp/story.list
cd ./tmp
touch shencao girl
touch "shencao girl" # dot NOT use Space , troublesome 


cat /etc/issue
cat -n /etc/issue

cat /etc/services
tac /etc/services # reverse

more /etc/services # page arrow down  or space  a page , enter a line 
less /etc/services # page arrow down  or space 
# /keyword  search , n   next-match

head /etc/services # -n : n line 
tail -n 3 /etc/services #  

cp /etc/services  /home/gao/tmp/
ln -s /home/gao/tmp/services service_link
ln /home/gao/tmp/services service_hard


ls -i /home/gao/tmp/services 
ls -i service_link
ls -i service_hard
ls -il service_link
ls -il service_hard

echo "www.lampbrother.com" /home/gao/tmp/services service_hard

# difference between hardlink  and cp -p  , can keep updating
# hard ln cannot cross partion  不能跨分区，
# 硬连接不能对目录使用

