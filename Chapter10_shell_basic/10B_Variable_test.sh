计算机为了测试某一个变量，这里是y 存在，不存在，存在但是为空字符串三种情况下的自动测试

# 程序自动执行的时候，无法用人眼看到变量的赋值情况
# 所以需要自动测试

unset y
echo $y
x=${y-new_value}
echo $x

y=""
echo $y
x=${y-new_value}
echo $x


y=old
echo $y
x=${y-new_value}
echo $x


# - 之前加上了 ：
y=""
echo $y
x=${y:-new_value}
echo $x


# 还有 +/-/= 的区别，  还有： ？
# 需要的时候现查，基本上

# 带？ 基本上是给用户看的