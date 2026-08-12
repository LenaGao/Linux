# 服务器高度可以处于高速运转状态，和个人机差别较大
# 服务器禁止关机只能重启 <<<<========================================
# 关机之前要关闭服务
# shutdown 关机之前会合理保存文件
shutdown -h now # shutdown now 
shutdown -h 20:50 # shutdown 20:50 
shutdown -r now # reboot now # 20:30:30
shutdown -c # cancel

halt
poweroff # Most dangerous do NOT use  << ==== 
init 0

=== reboot
reboot
init 6

cat /etc/inittab # already depreciated!  <<<< ====
runlevel
N 3      # N : ealier level, N means from reboot 

0 关机                                  halt
1 单引户 == Root                        Single user mode， ROOT
2 不完全多用户，不含NFS服务（网络文件系统）Multiuser, without NFS , network file system
3 完全多用户   Full Multiuser mode , with NFS                           
4 未分配    unused 
5 图形界面  x11
6 重启      reboot(No NOT set initdefault to this)

# Linux X 基本上都是图像界面窗口的，或者图像界面，大写X 
X  X11,  X86,  X window X free86

upcase X all means GUI

id:3:initdefault  # 修改默认运行级别，0  4 6 都禁止， 1235 可以，真实服务器是35， 尤其是3为主

# Importang!! for system administrator
logout