#1/bin/bash
#Lena Gao Lena-Gao@hotmail.com

echo "Mr Shencao is the most hoest man in lampbrother"


# 在linux 系统管理中， 还是方法A 更主流，我个人明确更喜欢 方法B
# 执行方法 A  赋予可执行权限，然后直接运行
# chmod 755 /home/lena/Linux/Chapter10_shell_basic/2_echo/2_2B_ehco_ShenCao.sh
# 然后用绝对路径或者相对路径的方式来执行
# /home/lena/Linux/Chapter10_shell_basic/2_echo/2_2B_ehco_ShenCao.sh
# 然后用绝对路径或者相对路径的方式来执行
# ./2_2B_ehco_ShenCao.sh

# 执行方式  B  通过 bash 命令调用执行脚本，此时该文本本身是否可执行无所谓 
# 绝对路径或者相对路径 
# bash /home/lena/Linux/Chapter10_shell_basic/2_echo/2_2B_ehco_ShenCao.sh
# 绝对路径或者相对路径 
# cd /home/lena/Linux/Chapter10_shell_basic/2_echo/
# bash 2_2B_ehco_ShenCao.sh