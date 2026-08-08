# 网络命令
write  # to online user， 必须在线

# write all
wall  minge is the honest man # to all online user  

sudo ping -c 3  google.com # try 3 times 
sudo ping -c 3 192.168.1.171 # No C , never stop 


ifconfig  # check and set ip address 
# eth0
# lo

mail root # 用户不在线，还是可以使用

# Important log cmd 
last     # all user login time and computer reboot time 
lastlog  # all user 
lastlog  -u 501 # all user , uid

traceroute www.google.com

netstat -tlun # 查看本地监听的端口 , and 间接判断本地有哪些服务
-t tcp  -u udp  
-l listen
-n show IP and terminal  ==>  127.0.0.54:53

netstat -an   # 查看本机所有的网络连接  -a all  # connected /established

netstat -rn   # 查看本机路由表 网关是 Gateway 

netstat -an | grep ESTAB*  # 正在连接的程序

setup # redhat setup address 

service network restart # 重启网络服务

# 挂载和卸载存储设备
mkdir /mnt/cdrom 
mount /dev/sr0 /mnt/cdrom 
mount -t iso9660 /dev/sr0 /mnt/cdrom # -t might be omit

# 卸载
umount 
# 必须离开设备挂载点才能卸载该设备

ll  /dev/cdrom