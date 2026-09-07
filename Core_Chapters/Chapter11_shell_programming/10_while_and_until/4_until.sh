#!/bin/bash

# 和while相反，条件不成立的时候则一直循环
i=1

until [ $i -gt 6 ]   # 条件和whil 相反， while 是小于等于6的时候 一直运行， 这里是在大于等于6的时候，停止循环
do
	echo "Welcome $i times."
	i=$(( i+1 ))
done
