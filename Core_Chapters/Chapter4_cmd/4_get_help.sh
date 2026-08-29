# help   shell 内置命令
# shell 就是最基本的console 窗口和做出反应的解释应答程序，包含最最基本的命令
help cd 
help echo 
help help

which cd   # 无输出, 这是因为内置命令找不到路径, 是命令解释器本身的一部分
which help # 无输出，这是因为内置命令找不到路径, 是命令解释器本身的一部分
# 但一些内置命令也还有一个外部命令的同名兄弟， 包括echo 和 pwd

# manuel ， 命令和配置文件的帮助文档
# 这个包括独立安装的一切命令都可以用man

man ls       # command 
man find     # command 
man services # configure file 
more services # configure file 
# man /etc/services      # NOT corret way, show whole file
man passwd       # default is cmd help
whereis passwd   # cmd and configure file location
man 1 passwd # cmd help
man 5 passwd # configure file help  

# 获取配置文件的简单信息： short a line help 
apropos passwd 
apropos inittab
whatis ifconfig

# --help general short than man
touch --help
help  --help

# bash build-in commands, such as cd, umask
man cd         # POSIX Programmer's Manual, more a file , q to quit 
info cd        # same as man cd 
help cd        # show help directly in bash GUI , no q needed! 
cd --help



date --help
whatis date
info date

which cd 
man ls
/-l search the option in the man page , n==> next match , down arrow key to next line , q==> quit
# man cd

date
man date 
man services # 配置文件帮助文档
man passwd   # 命令帮助文档 ， 既有命令又有配置危机，优先查看命令
man 1 passwd
man 5 passwd
# dnf install info

data --help # BASH buildin command 
cd --help
umask --help
help umask 
help cd

cd --help
clear --help

# 命令简短信息
whatis date
man date
# 配置文件简单信息 
appropos date
info date # to me, useless 

# 专门针对内置命令的 help 工具： <<<<<<<<<< ==================
whatis cd  #  nothing appropriate.
which cd   # NOthing shown up， 没有路径，说明是 bash 内置命令

===== 意思两个命令都无效
whatis echo 
man echo 
help echo 
# 找不到路径的 命令就是 bash 内置命令，内置命令的执行效率更高，因为不需要创建子进程。
# cd pwd umask  echo printf # bash 内置命令
man cd  #No manual entry for cd
type cd  # cd is a shell builtin

# shell built-in commands 的帮助命令用 help 
help umask


### ======================== 其实一切命令都可以使用 --help 来查看帮助信息，尤其是 GNU 命令，通常会提供详细的选项说明。
# 例外是echo  --help 会被解读成参数，  这个用 前help
这是最佳办法 
cd --help
ls --help
umask  --help
man echo 
which echo 
whatis echo


man cd       # command 
help ls      # command ls 是普通命令， 
# 前部 help 只能用于 bash 内置命令，ls 不是内置命令，所以 help ls 无法使用
# 后部 --help 可以用于所有命令，显示简短帮助信息
# 但例外是echo ， 因为这是现实命令，--help 会被认为是 echo 的参数，而不是帮助信息，所以 echo --help 无法使用
# 
man echo
help echo



Bash（Bourne Again SHell）内置命令（Built-in commands）是指直接集成在 Bash shell 内部的命令。

它们不需要通过创建新的子进程来执行，因此执行速度更快，且能够直接改变当前 Shell 的状态（例如 cd 必须是内置命令，否则子进程无法改变父进程的当前目录）。
由于完整的内置命令较多（约 60-70 个），这里我将它们按功能分类列出，并在文末提供如何在你的系统中直接查看完整列表的方法。
一、 核心功能分类列表
1. 目录与路径管理
cd：切换当前工作目录。
pwd：打印当前工作目录。
pushd：将目录压入目录栈，并切换到该目录。
popd：从目录栈弹出目录，并切换到该目录。
dirs：显示当前保存的目录栈。
2. 变量与环境管理
export：将变量导出为环境变量，使其对子进程可用。
declare / typeset：声明变量并设置其属性（如整数、数组、只读等）。
local：在函数内部声明局部变量。
readonly：将变量标记为只读，不可修改。
unset：删除变量或函数。
let：执行算术运算（如 let a=1+2）。
3. 输入与输出
echo：打印字符串（Bash 内置的 echo 比 /bin/echo 更快）。
printf：格式化输出数据（类似于 C 语言的 printf）。
read：从标准输入读取一行，并将其赋值给变量。
4. 脚本控制与执行
source 或 .：在当前 Shell 环境中读取并执行脚本（不创建子进程）。
exec：用指定的命令替换当前的 Shell 进程（执行后当前 Shell 会消失）。
eval：将传入的参数作为一行 Shell 命令来解析并执行。
exit：退出当前 Shell。
return：从 Bash 函数中退出，并返回一个状态码。
5. 作业与进程控制
jobs：列出当前 Shell 的后台作业。
fg：将后台作业移到前台运行。
bg：让暂停的作业在后台继续运行。
kill：向进程或作业发送信号（默认发送 SIGTERM 终止进程）。
wait：等待指定的后台进程结束，并返回其退出状态。
disown：将作业从当前 Shell 的活动作业列表中移除（防止终端关闭时作业被挂断）。
6. Shell 选项与行为设置
alias：定义命令别名。
unalias：取消已定义的别名。
set：设置或取消 Shell 选项，或者设置位置参数（如 $1, $2）。
shopt：切换Bash的高级可选行为（如 shopt -s extglob）。
bind：显示或修改 Readline 快捷键绑定（如修改终端里的 Ctrl 快捷键行为）。
7. 命令信息与查找
type：显示命令的类型（内置命令、别名、函数还是外部可执行文件）。
help：显示内置命令的帮助文档（相当于内置命令的 man 手册）。
command：忽略同名的 Shell 函数和别名，强制执行指定的命令。
builtin：强制执行 Bash 内置命令（用于绕过同名的函数）。
hash：管理并记住最近执行过的外部命令的路径（通过缓存提高查找速度）。
8. 流程控制（辅助命令）
(注：if, for, while 等属于 Shell 关键字，但以下几个控制命令属于内置命令)
break：跳出 for、while 或 until 循环。
continue：跳过本次循环的剩余部分，直接进入下一次循环。
shift：将位置参数（$1, $2...）向左移动（例如 $2 变成 $1）。
二、 实用技巧 (Tips)
1. 如何判断一个命令是否是内置命令？
使用 type 命令：
code
Bash
$ type cd
cd is a shell builtin       # 提示是内置命令
$ type ls
ls is aliased to `ls --color=auto' # 提示是别名
$ type grep
grep is /usr/bin/grep       # 提示是外部命令
2. 如何查看内置命令的帮助文档？
对于内置命令，普通的 man cd 可能查不到具体细节（通常会跳到 Bash 全局手册）。你应该使用 help 命令：
code
Bash
help cd
help read
help export
3. 如何在你的电脑上获取完整的内置命令列表？
你可以直接在终端中运行以下命令之一，获取你当前 Bash 版本的完整内置命令列表：
方法一： 运行 help （会打印出所有内置命令及简短说明）
方法二： 运行 compgen -b （会输出一个纯粹的内置命令列表，适合用于脚本）
方法三： 运行 enable （列出当前所有激活的内置命令）