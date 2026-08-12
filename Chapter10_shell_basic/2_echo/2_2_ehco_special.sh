#1/bin/bash

# 双引号内，反斜杠只会对 $、`、"、\ 和换行起转义作用。
# "ab\\\bc" 中：
# \\ → 一个反斜杠 \
# \b 中的 b 不属于可转义字符，所以保留为 \b
# 因此传给 echo 的实际内容是 ab\\bc，输出便是：

# 这里双引号的解析与前一条相同："ab\\\bc" 先变成 ab\\bc（两个反斜杠）。
# 但 echo -e 会再解释参数里的反斜杠转义：
# \\ → 一个字面反斜杠 \

# b 只是普通字符
# 所以最终输出：
# ab\bc
# 注意 echo -e 的行为在不同 shell 中可能不完全一致；需要稳定结果时更推荐：
# printf '%s\n' "ab\\\bc"

echo   "abc"
echo   "ab\bc"
echo  -e "ab\bc"

echo   "ab\\\bc"  # \\  # 
echo  -e "ab\\\bc"  # \\



echo  -e "a\tb\tc\nd\te\tf"  # \t : tab  \n :new_line
echo  -e "\x61\t\x62\t\x63\n\x64\t\x65\t\x66"  # \t : tab  \x61 :16进制下的61代表的字符 （a）

echo  -e "\e[1;31m abcd  \e[0m"
echo  -e "\e[1;32m abcd  \e[0m"
echo  -e "\e[1;33m abcd  \e[0m"
echo  -e "\e[1;34m abcd  \e[0m"
echo  -e "\e[1;35m abcd  \e[0m"
echo  -e "\e[1;36m abcd  \e[0m"
echo  -e "\e[1;37m abcd  \e[0m"
echo  -e "\e[1;30m abcd  \e[0m"

# -e support special output 
# "\e[1;   \e[0m" start and end color output

# 黑            
# 红 绿 黄 蓝
# 洋红 青色 白色