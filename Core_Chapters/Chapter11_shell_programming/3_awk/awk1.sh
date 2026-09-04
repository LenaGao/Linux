#!/bin/bash


# awk之所以存在，注意是因为空格难以处理，尤其是按列提取

# 实际上除了空白作为分割，有tab， ， ：等分隔符的， 尽量用cut

# 格式 awk 【条件】 打印  文件



pwd
cd /home/lena/Linux/Core_Chapters/Chapter11_shell_programming/3_awk


awk 是列处理命令，但实际工作中也是先读入一行，
然后按分隔符分割成列，最后按列处理


cat ../data/student.txt #  df_info.txt

和其他编程语言不通，$1,$2,$3,$4,$5,$6分别表示
第1列，第2列，第3列，第4列，第5列，第6列
不是从0开始的，awk中没有数组的概念，只有列的概念
python语言， C语言， Java语言等主流编程语言都是从0开始的，awk是从1开始的
R语言也是从1开始的，

R语言是统计学家发明的，
awk是系统管理员发明的

Please use print  NOT printf (datail in dir: 2_column)
因为自动加入换行符，print比printf更方便

awk '{print $1 "\t" $3 "\t" $5  }'      ../data/student.txt #  df_info.txt
awk '{printf $2 "\t" $4 "\t" $6 "\n" }' ../data/student.txt #  df_info.txt



df  -h
df -h | awk '{print $2 "\t" $4 "\t" $5 "\t" $6  }' # print is better than printf, no \n needed
df -h | grep sd  # 只看常规硬盘，sd开头，sda ，sdb ， 等等
df -h | grep sd | awk '{print $5  }' | cut -d "%" -f 1 # print is better than printf, no \n needed
# printf %ni
# printf %m.nf