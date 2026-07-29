##### 从一开始接触Linux 开始，就要记住这是服务器，很多人工作，很多人使用，
一旦出错，破坏性和个人机不可同日而语


目录结构
###### The root directory of the file system (/)
1. /

###### The commands in the following directories are commonly and  the last two directories are used by system administrators:

##### 可执行文件/命令 常规在以下四个目录=======
2. /bin       二进制可执行文件，超级用户普通用户均可使用
3. /sbin      只有root可以咨询
4. /usr/bin   在单用户模式下不可执行 usr NOT user, : Unix System/software Resources 
5. /usr/sbin  自由超级用户可以使用
===== Above 可执行文件/命令=======
18. /usr   # 系统资源目录: Unix Software Resource, NOT user data!
   

6. /boot  启动命令目录   
7. /dev   设备文件目录 , 这个目录的设备文件用亮黄色标注
8.  /etc # configuration files 配置文件保存位置

##### 家目录    
17. /root  # home directory for the root user
9.  /home       # home directories for users

10. /lib        # 系统调用的函数库保存文章  library files
11. /lost+found # 磁盘碎片，每个分区一个
 recovery directory for deleted files each <font color="blue">each partition</font> has a lost+found directory

###### 系统默认创建的挂载目录 三个
===== 只有空目录才能用作挂载点，其他目录都不能用作挂载点。
11. /media # mount point for removable media   
12. /mnt   # mount point for temporary mounting
13. /misc  # miscellaneous devices and filesystems， 系统建议挂载NFS服务的共享目录
   
14. /opt       # optional add-on software
    /usr/local # 更通用的第三方软件保存位置 << ===  Unix System Resources

###### The following directories are virtual and cannot be created by users: 虚拟文件系统    
这两个目录均不在硬盘中，而在记忆体/内存中
15. /proc  # virtual file system for process information  
16. /sys   # virtual file system for system/kernel information  内核相关




19. /run  # temporary directory for runtime data
  20. /srv # data for servers,  为各种服务数据提供一个目录， 服务数据目录
   
   
21. /tmp # temporary directory
18. /var  # variable data, such as logs, databases, and caches 动态数据保存目录，缓存，日志已经软件运行产生的文件
   
 