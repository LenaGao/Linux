计算机为了测试某一个变量，这里是x 存在，不存在，存在但是为空字符串三种情况下的自动测试

unset y
echo $y

x=${y-new_value}
echo $x
