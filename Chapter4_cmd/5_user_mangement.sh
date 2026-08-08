sudo useradd liming 
sudo passwd liming 


用户修改自己的密码 
passwd # No need add username ,  因为普通用户改密码就是改自己这个用户的密码
# shenchao sh@mcha0  passwd 

who        # 当前登录用户
w          # 当前登录用户的详细信息， 其中up: uptime 
whoami     # 我/当前用户是谁
loginctl list-users # 系统识别的所有用户：
last     # all user login time and computer reboot time 