#!/bon/bash

字符串的判断实际上最常用的
就是判断是否为空，是否相等，是否不相等

name1=zhen
name2=gao

[ -z $name1 ] && echo "it's not exist" || echo "it's exist"

[ $name1 == $name2 ] && echo "it's same" || echo "it's different"
[ $name1 == "passed" ] && echo "The string is passed" || echo "it's different"

# -z 不为空
# -n 为空 

== 判断字符串相等
# == means string same ,  different from   -gt etc
实际上 = 也可以判断字符串相等
但是因为 = 也可以用来赋值，
所以最好不要使用 = 来判断字符串相等，避免混淆


!= 判断字符串不相等
# !=

aa=11
bb=22

[ $aa != $bb ] && echo "it's different" || echo "it's same"

