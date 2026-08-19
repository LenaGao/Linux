# globing 通配符是用来匹配文件名的， 其实就三个符号，？ * []
# ?    # 任意一个字符
# *    # 任意字符任意次，包含0次
# []   # 一个范围  但只是一个字符

# [-]  # 一个范围，比如 0-9 a-z， 一个字符， 但不存在单独使用-， 这个没有前后范围所以无意义
# [^]  # 取反, 必须匹配一个符合




# 注意tmp 是临时目录，数据不保存
# 所以在这里进行各种删除实验
pwd
cd /tmp/
ls


# !! 通配符必须完全匹配
touch 0abc
touch 0abcd


ll *abc 
ll ?abc 

touch 123
touch 123XYZ
touch abcd

ll *[0-9]
ls [0-9]*

ls [^0-9]abc # 不存在abc 之前有任意一个非数字符号的

ls [a-z]abc  # 不存在abc 之前有任意小写字符
ls [A-Z]abc  #   存在abc 之前有任意大写字符

touch Xabc

ls *[0-9]*[0-9]


# 其他特殊符号

''   # 单引号中的所有特殊符号均无特殊含义,包括 $  and ``

""   # 双引号中的所有特殊符号均无特殊含义,但 $   ``  \ 除外，分别有调用变量值，引用命令， 转义符的特殊行业已

``   # 反引号，执行系统命令， 并打印命令的输出，但不推荐，因为非常容易看错

$()  # 和反引号一样，用来引用系统命令，推荐

$  # 调用变量值

\  # escape  转义符


name=LG         #变量赋值
echo '$name'
echo "$name"
echo `date`
echo $(date)
echo '`date`'
echo "`date`"
echo "$(date)"

abcDate=`date`
echo $abcDate