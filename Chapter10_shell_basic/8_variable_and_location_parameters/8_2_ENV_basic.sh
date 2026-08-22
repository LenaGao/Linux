# 用户自定义变量的命名，作用都自由
# 用户自定义只在当前shell中生效

name=sc
age=18

# 环境变量允许用户添加，或者把某些变量声明为环境变量
# 环境变量会在当前shell和这个shell的一切子shell中生效
# 环境变量如果写入配置文件，那么就会在一切shell中生效


export age           # 把变量声明为环境变量 
export gender=male   # 直接创建环境变量 

bash # 进入子shell

pstree 

echo $gender

# all  ENV variable can to wrotten to .bashrc   <<<<<===配置文件

env  # check all ENV variable， 但PS1 查不到
set  #  更多的环境变量
set | grep PS1 # 可以查到PS1



# all cmd are searched in PATH， 也就是命令搜索路径
$PATH 

# 我们通常会增加命令搜索路径，这样新的命令就以找到

PATH="$PATH":/home/lena  # 变量叠加, 临时生效
# 要想永久生效，就必须写入对应的配置文件   这里是 .bashrc


# PS1 can only check with set 
$PS1     # 定义用户的提示栏              
\[\]\[\e]0;\u@\h:: 
\h 显示简写主机名
\u 显示当前用户名
@  显示这个字符
[   显示这个字符
]   显示这个字符



unset  # del a variable by name 



