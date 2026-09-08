# (1) ============= Processes基本概念 ========================

进程是正在运行中的程序
每个进程都是一个运行的实体，都有自己的地址空间，会占用一定资源

有的进程瞬间就完成，很难抓住运行中的进程
而有的大型生物信息进程会运行好几天
如果是服务器，很多进程会处在永久运行状态（比如网站服务器）
或者理想状态是永久运行状态



windows任务管理器会列出所有正在运行的程序, 进程管理和window 中的任务管理器的工作非常类似


任何程序只要要运行就会占用一个或多个进程号（PID，Process IDentifier）
每个进程都有一个父进程（PPID，Parent Process IDentifier）
每个进程都有一个所属用户（UID，User IDentifier）
每个进程都有一个所属组（GID，Group IDentifier）


进程管理是不是就是为了终止进程(杀死进程)？see bottom

# (2) =============Processes管理命令
ps aux                # 查看所有用户的进程, UNIX风格
ps -aux               # - 并不出错，但会被忽略
ps -ef                # 查看所有用户的进程, Linux风格
ps -le                # 查看所有用户的进程,Linux风格，显示更详细信息

=========其实核心就是上面这个三个
样本：

ps aux                # 查看所有用户的进程, UNIX风格
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.1  23364 13344 ?        Ss   18:07   0:00 /sbin/init
root           2  0.0  0.0   3180  2208 hvc0     Sl+  18:07   0:00 /init
root           6  0.0  0.0   3216  2140 hvc0     Sl+  18:07   0:00 plan9 --control-socket 7 --log-level 4 --server-fd 8 --pipe-fd 10 --log-trunca
root          39  0.0  0.1  68384 16256 ?        S<s  18:07   0:00 /usr/lib/systemd/systemd-journald

==== /sbin/init  进程的PID 永远都是 1  
系统启动的第一个进程，是其余所有进程的父进程


ps aux | grep httpd   # 查看所有用户的httpd进程, UNIX风格
ps -aux | grep httpd  # - 并不出错，但会被忽略

ps -ef | grep httpd   # 查看所有用户的httpd进程, Linux风格
ps -le | grep httpd   # 查看所有用户的httpd进程,Linux风格，显示更详细信息

PID                   # 进程ID
/sbin/init            # init进程，所有进程的祖先进程，PID=1, PPID=0 计算机启动后第一个运行的进程
PPID                  # 父进程ID
UID                   # 进程所属用户ID
GID                   # 进程所属组ID
%CPU                  # 进程占用的CPU百分比

VSZ                # 进程使用的虚拟内存大小 (Virtual Set Size)
RSS                # 进程使用的物理内存大小 (Resident Set Size)
TTY                # 该进程是在哪个终端中运行，tty1-tty6 是本地字符界面终端，tty7是图形终端，pts/0-255 代表虚拟终端 ， 可以认为远程登陆


tty                # 终端类型
tty1-6             # 字符界面物理终端
tty7               # 图形界面物理终端
pts/0-n            # 伪终端 256个
CMD                # 进程名称
STAT               # 进程状态, 有下面这几种    
    R 运行中 (Running)
    S 睡眠中 (Sleeping)
    D 不可中断睡眠 (Disk sleep)
    T 停止 (Stopped)
    Z 僵尸进程 (Zombie)，正确中止会产生临时性的僵尸进程，如果始终存在说明父进程没有正确回收子进程
    S+ 前台进程 (Foreground process)
    Sl 多线程 (Multi-threaded)
    Sl+ 多线程前台进程 (Multi-threaded foreground process)
    + 高优先级 (High priority)
    Ss  会话首进程 (Session leader)
TIME               # 进程使用的CPU时间总和



查看系统健康状态
top                   # 实时查看系统进程状态, 每3秒钟更新一次
前五行 top 5 lines show most important system info
up 已经运行了一天3h26 分

htop                  # 更友好的实时查看系统进程状态（需要安装htop包）


pstree                # 以树状图显示进程关系


终止进程
(1) 按照进程号
kill -l              # 查看各种可以使用的信号
1 关闭该进程并重启
2
8  
9 强制终止

注意只能加进程号，不能加进程名
kill PID             # 终止指定PID的进程

kill 1 PID           # 重启指定PID的进程
kill 9 PID           # 强制终止指定PID的进程

注意杀父进程，子进程也被杀死，但可以独立杀死子进程

(2) 按照进程名
killall process_name  # 终止所有指定名称的进程
killall httpd     # 终止所有所有apache 进程， 包括apache 父进程和一切子进程
killall -9 httpd  # 终止所有指定名称的进程


(3) 非常类似killall， 
但可以按照终端号踢出用户

pkill -t    # 按照终端号踢出用户， 比如踢掉某一个本地终端上的用户，踢掉某个远程登陆上的用户 

先用w命令查询本机已经登陆的用户

w  

再用pkill 踢掉用户
也就是强制杀死从pts/1 虚拟终端登陆的所有进程

pkill -t -9 pts/1  


nice -n 10 command    # 以较低优先级运行命令
renice -n 5 -p PID    # 修改指定PID进程的优先级

只有正确中止不生效的时候才使用kill -9 PID 强制终止进程

# (3) =============后台运行进程 & 和 nohup
command &             # 在后台运行命令
nohup command &       # 即使退出终端也继续运行命令
jobs                  # 查看当前用户的后台任务
fg %1                 # 将后台任务1带到前台
bg %1                 # 将任务1继续在后台运行   
bg  %2                 # 将任务2继续在后台运行
fg %2                 # 将任务2带到前台

# (4) ============= 进程管理的目的 ========================
# 进程管理的目的
查看服务器健康状态  =========== 这是运维工程师的进程管理的首要工作， 大型网站往往有 { 监控服务器 }

查看服务器负载

查看系统中所有进程
监控非法进程==病毒和木马

查看当前用户的后台任务

释放系统资源

终止无响应进程
调整进程优先级
监控系统性能

确保关键服务运行
彻底关闭不必要的服务

彻底消灭恶意软件和病毒，不只是终止恶意进程 ======<<<<<<<<<<<<<<<<<<<<< 

优化系统性能和响应速度

搭建监控服务器