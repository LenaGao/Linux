#!/bin/sh


# test if the directory /root exists
使用专用的test格式
[ -e /root ] && echo "the directory /root exists" || echo "the directory /root does not exist" 


# test if 我的bash 是 /bin/bash
使用常见的if then else 格式 

if [ "$SHELL" = "/bin/bash" ]; then
    echo "your login shell is the bash (bourne again shell)"
else
    echo "your login shell is not bash but $SHELL"
fi

# if ; then  在一行中需要加； 
# if  
# then 分成两行，不需要；