# Linux 中变量默认是字符
aa=11
bb=22

declare -p  aa  # 显示类型， 无符号，为默认字符串型
declare -i  cc=$aa+$bb  #强制声明，各处无空格
echo $cc
declare -p  cc  # 显示类型， 为 -i ， interger 整数型


# -i # 数值型变量 减号是设置类型属性
# -x # 环境变量， 和export 本质上相同
# -p #显示类型



