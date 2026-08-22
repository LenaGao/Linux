#!/bin/bash 
# location parameters 我一开始的应用写法是错的，不应该是这个写法
# 这里的位置参数是 positional 不是location
# bash positional parameter 有4种， $n  $*  $@  $#


$n # 其中n为数字 $0 $1 $9 ${12}

# $0, cmd itslef , $1-9 and later are location parameters, 
# ${10} and after have to use {}

$* # all locations parameters as a whole 

$@ # all locations parameters individually

$# # all locations parameters numbers