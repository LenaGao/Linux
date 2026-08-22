# 用户自定义变量的命名，作用都自由
# 用户自定义只在当前shell中生效

name=sc
age=18

# 环境变量允许用户添加，或者把某些变量声明为环境变量
# 环境变量会在当前shell和这个shell的一切子shell中生效
# 环境变量如果写入配置文件，那么就会在一切shell中生效


export age           # 把变量声明为环境变量 
export gender=male   # 直接创建环境变量 

# all  ENV variable can to wrotten to .bashrc   <<<<<===配置文件

env # check all ENV variable

unset  # del a variable by name 

pstree 


# all cmd are searched in PATH
$PATH
# PS1 can only check with set 
$PS1     # 定义用户的提示栏              
