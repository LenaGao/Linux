# 规划好目录结构，少用 find 命令，避免搜索整个系统，浪费时间
# 负载高峰期，尽量避免使用 find 命令，尤其是搜索整个系统，可能会导致系统负载过高，影响其他用户的操作。建议在特定目录下进行搜索，或者使用 locate 命令来快速查找文件。
# windows everything 也可以搜索整个系统，速度很快，
# linux 没有类似的工具，locate 也只能搜索已经建立索引的文件，不能搜索整个系统
# 搜索条件越具体/精准，搜索范围越小，搜索速度越快。尽量使用精确的文件名、路径和类型来缩小搜索范围。

=========== ++++++++++++++++ Part I
# find file search, 默认精准搜索
# Ubuntu 2026 已经没有init文件了，init已经被systemd取代了，所以找不到init文件
# find /etc/ -name init
# sudo find /etc/ -name init
# sudo find /etc/ -name init
# sudo find /etc -name init* # init 开头
# sudo find /etc -name init??? # init + 3 characters
# sudo find /etc -name inittab 
# sudo find /etc -iname init* 
# find file search, 默认精准搜索
sudo find /etc/ -name cron
sudo find /etc/ -name cron
sudo find /etc -name cron* # cron 开头
sudo find /etc -name cron??? # cron + 3 characters
sudo find /etc -name crontab 
sudo find /etc -iname cron* 

# +n, -n n 大于小于等于, 不能用如下搜索，因为wsl 能够搜索window11的硬盘，出现很多不应该出现的文件
sudo find / -type f -size +5G -exec ls -lh {} \; 2>/dev/null
# check how many Byte for 1 block 
sudo blockdev --getbsz /dev/sda 
# 4096  1 block = 4KB 
# -2048 2048   这里的数字是block， 需要把block 换算成 大写 
# 1M = 1024KB
# 100M = 102400KB = 25600 block
echo $((100 * 1024 * 1024 / 4096))  # 100M 文件换算成数据快

# -ok -exec
# -ok ask by each file,   hence -exec is much more popular
sudo find /home/gao -type f -size +100M -exec ls -lh {} \; 2>/dev/null
sudo find /home/lena -type f -size +100M -exec ls -lh {} \; 2>/dev/null

sudo find /etc -name *init* -a -type f -exec ls -l {} \; # must keep the space "{} \;""
sudo find /etc -name *init* -a -type f -ok ls -l {} \; # {} \;  space is needed! 

# 根据所有者查找 
# 查找shencao的所有文件 -user 
sudo find /home -user shencao #
sudo find /home -user shencao -ok rm  {} \; ##
# -group
sudo find /home -group meinv #



# 文件的属性
amin # access time, 访问时间
cmin # file status change time, 文件状态改变时间
mmin # content modification time, 内容修改时间

# 1. 过去10分钟内被修改过的文件
find /your/path -mmin -10

# 2. 过去30分钟内没人访问过的文件（适合清理临时文件）
find /tmp -amin +30 -type f

# 3. 过去1小时内被修改但没被访问过的文件（可能正在被后台程序写）
find . -mmin -60 -amin +60

# 4. 过去5分钟内被 chmod 或 chown 过的敏感文件（安全监控必备）
find /etc /usr/bin /usr/sbin -cmin -5

# 5. 精确到1分钟前修改的文件（监控实时日志）
find /var/log -mmin -1 -name "*.log"

# 与 -atime / -ctime / -mtime 的区别（天 vs 分钟)


type f # file category, file type
f file , d directory, l link, c character device, b block device, s socket, p pipe
# -type f d l
# 注意原始方法是找block数目，而且恒定在512Byte， 不是本机4096Byte就改成4096， 所以会找出来 15M的文件
sudo find /home/gao -type f -size +25600 -exec ls -lh {} \; 2>/dev/null # 查找大于 $12.5\text{ MB}$ 的文件
sudo find / -type f -size +5G -exec ls -lh {} \; 2>/dev/null # 单位有c K M G 

find /etc -size +100 # 100 block, 4096 in this linux 
sudo find /etc -size +100  -a -size -2000 # larger than 100 block and less 2000 block


-a # and both requirements must be true
-o # or either requirement can be true 
#  -o or 

find /etc -user gao # 100 block, 4096 in this linux 

# inode number , Zhen 注： 这个实际上比较常用，因为有一些顽固文件，无法删除，使用 inode number 可以直接删除
sudo find . -inum 19275595   -exec rm  {} \; ## 删除顽固文件
sudo find . -inum 19275595   -exec ls -l  {} \; ## 展示详细信息



help find
man find
# -amin access time, 
# -cmin file status-e.g. owner 文件属性
# -mmin content modification 
find /etc -cmin -5   # less than 5min 

sudo tune2fs -l /dev/sda1 | grep -i 'block size'
# Block size:       1024

lsblk -o NAME,PHY-SeC # chek th block size 4096


=========== ++++++++++++++++ Part II 
# 建立了索引的文件搜索 locate 并不是在硬盘上找文件，而是通过查找一个数据库来快速定位文件。
# 这个数据库通常会定期更新，以反映文件系统的当前状态。locate 命令的优势在于速度快，但它只能找到已经被索引的文件，不能搜索整个系统。

# sudo apt install locate   # debian 
# sudo dnf install mlocate  # or sudo yum install mlocate
# sudo updatedb   # mlocate 程序本身已安装，但它的自动数据库更新功能（定时器）未能成功配置。

sudo apt install plocate

locate service

locate -i service  # 
locate inittab
locate locate  # /tmp not indexed

touch testfile
locate testfile  # not found, because / is not indexed
sudo updatedb # update the database, 需要root权限，更新索引数据库 , 第一次使用很慢，因为要创建整个数据库，后续使用会快很多
locate testfile  # not found, because / is not indexed

touch /tmp/zhangbozhi
sudo updatedb # update the database, 需要root权限，更新索引数据库
locate zhangbozhi  # found, because /tmp is NOT indexed

locate -i Zhangbozhi  # found, because /tmp is NOT indexed, 
# 有些位置不在locate的索引数据库中，locate命令无法找到这些位置的文件。比如，/tmp目录通常不在locate的索引数据库中，因此在/tmp目录下创建的文件无法通过locate命令找到。

# which command ， 查路径和有无别名
which ls      # see the dir color  is alias
ls -l
/usr/bin/ls -l # use the raw command directly
which rm               # from /usr/bin/rm, everyone can use it   
which cd               # No path are buildin command 
which umask
which useradd           # from /usr/sbin/useradd , only root can use it

# which and whereis 都可以查找命令的路径，但 whereis 还可以查找命令的帮助信息和配置文件。
# whereis 命令会在系统的标准路径中查找指定命令的二进制文件、源代码文件和手册页，并显示它们的路径。
whereis umask   # 命令和帮助信息
whereis passwd  # 命令和配置文件
whatis  passwd
whatis  passwd

# 别名，实际上大部分命令都是别名，alias ls='ls --color=auto'，可以使用unalias ls来取消别名，恢复原始命令。
# 是原有功能进行了增强，增加了颜色显示，方便区分文件类型和权限等信息。
# 大多数常用alias 写在了配置文件 ~/.bashrc 文件中，用户可以根据自己的需求进行修改和添加。

alias ls='ls --color=auto'
unalias ls

ls

source ~/.bashrc
ls

clear # = Ctrl + l
cp -r tmp1_ZG/ tmp3_ZG/
sudo cp /etc/services  .
sudo cp /etc/inittab .
cp services  services2
cp services  services3
cp -r /home/gao/Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/tmp .


# 查找文件内容，grep 某一行
cat inittab # inittab 文件已经被 systemd 取代了，所以在 Ubuntu 2026 中可能找不到该文件。
grep service /etc/inittab
grep -v ^#  /etc/inittab # -v  ;  Begninging # 
grep world file.txt
grep -i world file.txt 


gzip services2
gzip tmp2_ZG 
gzip   tmp2_ZG.tar tmp2_ZG # Only for FIles

