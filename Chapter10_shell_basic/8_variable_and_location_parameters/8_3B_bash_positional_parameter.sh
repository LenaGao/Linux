#!/bin/bash 
# location parameters 不应该是这个写法
# bash positional parameter 正确写法 ===

sum=$(( $1+$2  ))
echo $sum 



# bash 8_3B_location_parameter.sh 12 23