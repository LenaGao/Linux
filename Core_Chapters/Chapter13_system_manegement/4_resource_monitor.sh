# (3) ============= 内存和CPU占用  top的精简版
vmstat  2 3 # 在后台运行 vmstart 命令，参数为2和3, 每2秒刷新一次，共刷新3次，刷新延时，刷新次数 结果显示在终端
vmstat  --help # 在后台运行 vmstart 命令，参数为2和3
vmstat
# top ===> top 5 lines 


dmesg = display message（显示消息） 
#记忆技巧 

dmesg               #  查看系统资源，包括各种硬件信息和内核日志 
dmesg  | grep GPU # 查看系统资源，包括各种硬件信息和内核日志
dmesg  | grep CPU # 查看系统资源，包括各种硬件信息和内核日志
# CPU0: AMD Ryzen 5 5600H with Radeon Graphics (family: 0x19, model: 0x50, stepping: 0x0)

dmesg  | grep eth0


sudo lshw -C display

# 显示内存
free -h  # 查看内存 and swap 使用情况，-h表示以人类可读的格式显示
free -m  # 查看内存 and swap 使用情况，-m表示以MB为单位显示


#                total        used        free      shared  buff/cache   available
# Mem:            9945        2217        7347           3         584        7728
# Swap:           3072           0        3072
对系统来讲，可用内存是free buffer cache 之和也就是available， 这个是核心指标
buffer 是加速写入的
cache 是加速读取的

对linux系统之外的其他程序来讲，可用程序是free的大小 < === 我的初步理解 

并不存在"系统用 available，其他程序用 free"这种区分。 对任何要申请内存的程序（不管是"系统进程"还是普通应用程序），能实际拿到的可用内存都是 available，而不是 free。
原因：当一个程序调用 malloc/mmap 申请内存、并且当前 free 内存不够用时，内核会主动回收那些干净的、可回收的 page cache（比如很久没访问的文件缓存页），腾出物理内存分配给这个新程序。
这个过程对程序完全透明——程序不需要、也不知道内核在背后做了缓存回收，它只是正常拿到了内存。

所以：

free：只是"完全没被任何用途占用"的内存，是一个偏保守、偏小的数字。
available：free + 可以被快速回收挪用的那部分 buff/cache，代表任何新程序（不区分是系统还是用户程序）实际能申请到的内存上限。
举例：你的 free 只有 7347M，但 available 有 7728M，这多出来的 381M 就是内核认为可以从 cache 里回收出来给新程序用的部分。如果这时你启动一个需要 7500M 的新程序，
它是能成功申请到内存的（内核会回收 cache 补上），并不会因为 free 只有 7347M 就失败。

所以结论是：不管是系统本身还是外部程序，衡量"还能用多少内存"都应该看 available，而不是 free。 #<<==== Conclusion


那么buff/cache是不是已经被计算在 used 内了？ < === 我的问题

不是，buff/cache 没有被计算在 used 里，它们是三个互相独立、并列的类别：

total ≈ used + free + buff/cache

具体含义：
used：进程实际占用的内存，不包含 buffer 和 cache。
free：完全空闲、什么都没放的内存。
buff/cache：内核用来做缓冲区/页缓存的内存——这部分内存虽然"被占用"了，但不算在 used 里，因为它可以被随时回收给需要的程序用（这也是为什么 available 要把它算进"可用"里）。

用截图的数字大致对应（会有一点取整误差）：
9945(total) ≈ 2217(used) + 7347(free) + 584(buff/cache)

# 理解这个设计的关键点：Linux 有内存就尽量拿去做缓存，不会让它"白白空着"。所以看内存使用情况时：
# - 不要用 free 那一列判断内存紧不紧张（很多时候会显得很小，容易误判"内存不够用了"）。
# - 也不要把 buff/cache 当成"被程序吃掉的内存"（它不属于 used）。
# - 真正该看的是 used（进程真实占用）和 available（还能再用多少），这两个才是核心指标。

 


# 查看CPU

cat /proc/cpuinfo  # 查看CPU信息
cat /proc/cpuinfo |grep buffer # 查看CPU信息 
cat /proc/meminfo | grep -E "Buffers|Cached|MemAvailable" # 查看内存信息
# model name      : AMD Ryzen 5 5600H with Radeon Graphics

# cpu MHz         : 3293.724
# cache size      : 512 KB
# Buffers:        : 24172 kB


lscpu               # 查看CPU信息


uptime              # 查看系统运行时间和负载情况
w                 # 查看当前登录用户和系统负载情况

# 查看内核

uname
uname -a            # 查看系统内核版本和其他信息
uname -r            # 查看系统内核版本

file /bin/ls   # 外部命令 file 用于确定文件类型，顺带显示文件系统结构信息

lsb_release -a   # 查看Linux发行版信息


# 列举进程打开或使用的文件信息

lsof          #  列出进程调用或者打开的文件的信息
lsof -i       # 查看系统网络连接情况
lsof -c init  #只列出字符串开头的进程打开的文件
lsof -u lena  #只列出某个用户的进程打开的文件
lsof -p pid   #只列出某个pid进程打开的文件

# /bin/ls: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=39ce614fe25904d7d7db920df264c080e2cda850, for GNU/Linux 3.2.0, stripped

# windows11 powershell check cpu info
wmic cpu get /all /format:list