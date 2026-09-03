# cd Code/Linux_and_Cluster_for_Omics/LinuxCodes/lampLinux/Chapter11_shell_programming/1_regular_expression/

# * 前一个字符0次或者任意多长
grep "aaaaa*" ../data/test_rule.txt

# a* 前一个字符0次或者任意多长
grep "a*" ../data/test_rule.txt  #  因为包含0次，所有这个没啥一样，会列出全部文档 

# match sai
grep 'said' ../data/test_rule.txt

# . 任意一个字符
grep 'a..d' ../data/test_rule.txt

# .*   任意字符任意多次   # 等同于globbing 中的 *
grep "a.*d" ../data/test_rule.txt

#  s[ao]id*   
grep "s[ao]id" ./data/test_rule.txt

# ^M  以M开头
grep '^M' ../data/test_rule.txt



# .$  任意字符结尾的行
grep '.$' ../data/test_rule.txt

# n$ 以n结尾
grep 'n$' ../data/test_rule.txt

# ^$  空白行
grep '^$' ../data/test_rule.txt
grep  -n '^$' ../data/test_rule.txt # -n   显示行号

# [0-9]， 但是严格只能匹配一个数字， 也就是0-9中的任意一个数字，
但是因为正则是包含匹配，所以只要有一个数字就会被匹配到
grep '[0-9]' ../data/test_rule.txt
grep '[^0-9]' ../data/test_rule.txt 
但请注意，不匹配换行符

grep '^[^0-9]' ../data/test_rule.txt 
但请注意，不匹配换行符


转义符，用于取消后一个特殊字符的特殊含义，使其变为普通字符
# .$  以点号(.)结尾的行 ， 让. 变为普通字符
grep '.$' ../data/test_rule.txt

# \.$  以点号(.)结尾的行 ， 让. 变为普通字符
grep '\.$' ../data/test_rule.txt

# a\{3\} 包含3个a的行
grep 'a\{3\}' ../data/test_rule.txt

# [0-9]\{3\} 包含3个digit的行
grep '[0-9]\{3\}' ../data/test_rule.txt

#a\{3,\} 包含> 3个a的行 
因为是包含匹配，所以和3一样

grep 'a\{3,\}' ../data/test_rule.txt

# a\{3,5\} 包含> 3个a的行 # 因为是包含匹配，所以和3一样， 注意6个a的行被匹配到， 因为正则是包含匹配， 只要有3个a就会被匹配到
grep 'a\{3,5\}' ../data/test_rule.txt

# a\{3,5\} 包含> 3个a的行 , mp结尾，所有不一样，3-5个a的行被匹配到， 6个a的行没有被匹配到，因为3-5个a后面必须是mp结尾， 6个a的行没有被匹配到，因为5个a后面是amp结尾， 不是mp结尾
grep 'a\{3,5\}mp' ../data/test_rule.txt

grep 'a\{3,7\}mp' ../data/test_rule.txt

# ^[a-z] # 以小写字母开头的行
grep '^[a-z]' ../data/test_rule.txt

# ^[^a-z] # 不是以小写字母开头的行
grep '^[^a-z]' ../data/test_rule.txt

# ^[^a-zA-Z] # 不是以字母开头的行
grep '^[^a-zA-Z]' ../data/test_rule.txt

# ^[^a-zA-Z0-9] # 不以字母和数字开头的行
grep '^[^a-zA-Z0-9]' ../data/test_rule.txt


# ^ 行首
# * 前一个字符0次或者任意多长
# . 任意一个字符
# $ 行尾
# [] 括号内的任意一个字符
# [^] 取反
# \  转义符
# \{n\}  前面的字符恰好n次
# \{n, \} 前面的字符大于等于 n 次
# \{n, m\} 前面的字符 大于等于n 次， 小于等于 m 次