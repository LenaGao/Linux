#1/bin/bash

echo -e 选项究竟是干嘛？

例如： echo -e 让 echo 解释参数中的“反斜杠转义序列”。 核心是处理 
反斜杠开头的反斜杠转义

echo -e "a\nb"
常见转义：
echo -e "a\tb"    # \t：制表符
echo -e "a\nb"    # \n：换行
echo -e "a\\b"    # \\：一个反斜杠
echo -e "a\"b"    # \"：双引号
echo -e "ab\bc"   # \b：退格控制字符

对最后一项：
echo -e "ab\bc"
shell 先处理双引号：因为 \b 不由 shell 特别处理，所以仍是字符 \ 和 b。随后 echo -e 把 \b 转成退格：光标从 b 后退一格，再输出 c。因此终端通常视觉上显示为：
ac
不过 echo -e 不是完全可移植的：不同 shell 的 echo 对 -e 和转义的支持可能不同。脚本中通常使用更可靠的 printf：
printf 'a\nb\n'
printf 'ab\bc\n'


双引号内，\ (反斜杠) 只会对 '$' ;  '`' ;  '"' ; '\' 和'换行' 起转义作用。 <<== 这里的换行表观上还是反斜线 >>
核心是处理 几个特殊字符

== 示例如下：
当代的 Positorn 编辑器非常智能，只要出现橙色， 就是进行了转义， 不再起原有作用

# 1. \$：阻止变量展开，输出字面量 $
echo "\$HOME"
# $HOME

# 2. \`：阻止命令替换，输出字面量反引号
echo "\`date\`"
# `date`

# 3. \"：在双引号字符串中放入一个双引号
echo "他说：\"你好\""
# 他说："你好"

# 4. \\：表示一个字面反斜杠
echo "C:\\Users\\lena"
# C:\Users\lena

# 5. \换行：续行；反斜杠和换行本身都会消失
echo "hello\
 world"
# helloworld





# echo "ab\bc" 的双引号里，\b 不会被 shell 当作退格或特殊转义，# 因为 b 不在双引号中可被反斜杠转义的字符集合内。
# 因此反斜杠原样保留：
# echo "ab\bc"
# # 输出：
# ab\bc
# 只有加上 -e 时，echo 才可能把 \b 进一步解释为“退格”（具体行为依 shell 实现而异）：

# # 双引号内，反斜杠只会对 $、`、"、\ 和换行起转义作用。
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

echo     "abc"
echo     "ab\bc"
echo  -e "ab\bc"

echo     "ab\\c"
echo     "abc\`date\`"

echo     "ab\$home"
echo  -e "ab\$home"

echo     "ab\\\bc"  # \\  # 
echo     "ab\bc"  # \\
echo  -e "ab\bc"  # \\
echo  -e "ab\\\bc"  # \\



echo    "a\tb\tc\nd\te\tf"  # \t : tab  \n :new_line
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