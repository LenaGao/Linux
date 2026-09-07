#!bin/bash

# case 只能判断一种条件关系
# if 可以多种和嵌套条件关系
# 注意1： case 开头,  easc结尾 
# 注意2： 每个选择读有 ;; ， in each case <=== 极其容易失误
# 注意3： *) 用来包括其他一切不支持选项
# 注意4： *) 没有引号


echo 'If you want to buy ticket to Shanghai,  please input "1"'
echo 'If you want to buy ticket to Guangzhou, please input "2"'
echo 'If you want to buy ticket to Chengdu,   please input "3"'

read -t 30 -p "Please input your choice: " cho

case "$cho" in
    "1")
        echo "The Price is 1000"
        ;;
    "2")
        echo "The Price is 2000"
         ;;
    "3")
        echo "The Price is 3000"
        ;;

     *)
        echo "You have to input 1 or 2 or 3"
         ;;
esac
