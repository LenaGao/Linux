# 文件比较

Linux 文件系统中有三个时间戳：

修改时间     — mtime (modification time) — 文件内容被修改的时间
访问时间     — atime (access time)       — 文件被读取/访问的时间
状态改变时间 — ctime (change time)       — 文件的元数据（权限、所有者、链接数等inode信息）发生变化的时间，注意这不是创建时间（creation time），很多人容易混淆
对应 stat 命令查看时的字段：

Modify: mtime
Access: atime
Change: ctime

# 文件1 -nt 文件2　修改时间 newer than
# 文件1 -ot 文件2　修改时间 older than
# 文件1 -ef 文件2　两个文件的ioode号是不是一致， same inode， 如果是，意外这两个文件名只是同一个文件的不同名字，因为inode号是一样的


[ student.txt -ef lnk_stutdent.txt ] && echo "Yes, thy are same " || echo "No, Thay are have different inode "
