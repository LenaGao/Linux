#!/bin/bash
# set n to 1
n=1
 
# while 在概念上还是不定循环，是条件循环，只要条件成立，则巡演一直进行，直到条件不成立
# 必须防止死循环，没有退出可能


# continue until $n equals 5
#while [ $n -le 5 ] # notce the (( )) or []  (( )) 必须搭配  <=, [] 必须搭配 -le "$n"
while (( n <= 5 )) # while (( $n <= 5 )) 
	do
		echo "Welcome $n times."
		n=$(( n+1 ))	 # increments $n
	done

