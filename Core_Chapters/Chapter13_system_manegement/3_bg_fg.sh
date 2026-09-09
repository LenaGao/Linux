工作管理的核心：
把工作放入后台
查看后台工作
后台前台互相切换

# () =============后台运行
放入后台有两种方法
(1)
tar -zxf etc.tar.gz /etc &   # 将解压命令放到后台运行
(2)
top 
在执行的过程中，按下 Ctrl+z     # 这种方法放入后台的是暂停的

nohup command &       # 
nohub 的作用是 即使退出终端也继续运行命令

nohup 默认会把标准输出和标准错误都写入当前目录下的 nohup.out 文件
因为终端消失后没地方打印了
所以常见写法是：

nohup command > output.log 2>&1 &

和disown的区别：
nohup是在进程启动时就设置忽略 
disown是把已经在后台运行的作业从shell的作业表中移除，两者都能达到"关闭终端后进程不退出"的效果，但机制不同。

和setsid/systemd-run/tmux/screen 的区别：这些工具是完全脱离终端会话（新建会话），
而nohup只是让进程忽略挂断信号，进程仍然属于原来的会话，只是不会因为SIGHUP而终止。


# (2) ============= 后台运行进程 & 和 nohup
command &             # 在后台运行命令
nohup command &       # 即使退出终端也继续运行命令


# (3) ============= 后台运行进程 & 和 nohup
jobs                  # 查看当前用户的后台任务
-l  显示工作的PID

+ 代表最近一个放入后台的工作， 也是工作恢复时，默认恢复的工作
- 代表倒数第二个放入后台的工作

以下为实验
top  

then ctrl + z 放入后台
连续三次作为实验  

jobs -l
[1]  14515 Stopped (signal)        top
[2]- 14590 Stopped (signal)        top
[3]+ 14669 Stopped (signal)        top




# (4) ============= 前后台运行进程 切换

fg %1                 # 将后台任务1带到前台， 注意工作号不是PID
fg 1                 # % 可以省略， 和前面一条一样，我喜欢这个

fg                    # 无工作号
这种和刚才的有工作号正好相反，是把最后一个放入后台的 带到前台

jobs -l
[2]- 14590 Stopped (signal)        top
[3]+ 14669 Stopped (signal)        top


注意要可以运行的，top 这种交换程序，后台无法运行

fg 2                 # 将任务2带到前台
bg 2                 # 将任务2继续在后台=== >>>> 运行， 

tar -zcf root.tar.gz /    
Ctrl + z # 将解压命令放到后台 不运行 


tar -zcf root.tar.gz / &   # 将解压命令放到后台运行 

jobs -l
[3]+ 14669 Stopped (signal)        top
[4]- 17174 Running                 tar -zcf root.tar.gz / &

注意这个压缩命令是在running



# 把工作放入后台的两个方法， & 和 Ctrl + Z 
# (1)使用 & 符号将命令放入后台 ===> 运行, 这个在后台是运行的

tar -zxf etc.tar.gz /etc &   # 将解压命令放到后台运行
jobs                     # 查看后台任务
fg %1                    # 将后台任务1带到前台
fg  1                    # 相同

# （1.1） 与 nohup 命令联合使用，将命令放入后台运行，即使退出终端也继续运行
nohup tar -zxf etc.tar.gz /etc &    
将解压命令放到后台运行, 
即使退出登录也继续运行

# (2)使用 Ctrl + Z 将正在运行的命令放入后台， 这个在后台是暂停的，不运行的，需要用 bg 命令继续运行
top + Ctrl + Z    # 暂停top命令, 放入后台不再执行

### ===================== 查看后台任务 ==========================
jobs               # 查看后台任务

### ===================== 恢复到后台运行 ==========================
bg %1              # 继续在后台运行top命令
### ===================== 恢复到前台运行 ==========================
fg %1              # 将top命令带到前台运行

# =============================================
jobs 命令：查看所有后台作业jobs

$ jobs
[1]-  Running                 tar -zxf etc.tar.gz /etc &
[2] - Running                 find / -name "*.log" &
[3] + Stopped (signal)        vim my_file.txt


top #+ Ctrl + Z  # 暂停top命令, 放入后台不再执行

jobs
[1]-  Running                 tar -zxf etc.tar.gz /etc &
[2] + Stopped                 top   



vim my_file.txt &
现在 vim 仍在后台运行，但您已经回到了 提示符，可以执行其他命令。

fg 1     # fg %1    均可 将 vim 带到前台继续编辑 my_file.txt 文件
bg 1     # bg %1 将 vim 带到前台继续编辑 my_file.txt 文件

jobs -l