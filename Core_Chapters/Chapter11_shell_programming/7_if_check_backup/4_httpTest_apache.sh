#!/bin/bash
#Author Zhen Gao (Email: zhen.gao@yahoo.com)

# 脚本功能：检测 192.168.8.10 上的 http 端口状态，如果不是 open 就尝试启动 httpd 服务
# 提示：bash 变量赋值时 "=" 两边不能有空格，否则会被当作命令执行而不是赋值
port=$(nmap -sT 192.168.8.10  | grep tcp | grep http |awk '{print $2}') 
# 用 nmap 扫描端口，过滤出 http 对应行，取状态列（如 open/closed）

echo $port  # 打印扫描到的端口状态，便于调试

# 判断端口状态是否为 open
if [ "$port" == "open" ]
    then
        echo "The port is healthy"          # 端口正常，无需处理
    else
        /etc/rc.d/init.d/httpd start &>/dev/null  # 端口非 open，尝试启动 httpd 服务
        echo "The port is closed for some reason, please take care or check"
fi
