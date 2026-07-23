ssh-keygen -t ed25519 -C "junyi-gao@hotmail.com"

cat ~/.ssh/id_ed25519.pub

ssh -T git@github.com # answer yes to the prompt


git clone git@github.com:LenaGao/Linux.git # clone the repo using SSH from GitHub


git config --global user.name "Lena_Gao in wsl"

git config --global user.email "junyi-gao@hotmail.com"

# 第一步：生成新的 SSH 密钥
# 在终端中输入以下命令（将其中的邮箱换成你注册 GitHub 用的邮箱）：

# ssh-keygen -t ed25519 -C "你的邮箱@example.com"

# 接下来系统会提示你几步操作，一路按回车键（Enter）即可（默认保存在 ~/.ssh/id_ed25519，不需要设置密码）。

# 第二步：查看并复制公钥
# 生成成功后，输入以下命令把你的“公钥”打印在屏幕上：

# cat ~/.ssh/id_ed25519.pub

# 屏幕上会输出一长串以 ssh-ed25519 开头，以你的邮箱结尾的代码。用鼠标选中并复制这一整段代码。

# 第三步：把公钥添加到 GitHub
# 打开浏览器，登录你的 GitHub 账号。
# 点击右上角的头像，选择 Settings（设置）。
# 在左侧边栏找到 SSH and GPG keys，点击进入。
# 点击绿色的 New SSH key 按钮。
# Title（标题）：随便填，比如写 WSL-Lena，方便你以后认出这是哪台电脑。
# Key Type（密钥类型）：保持默认的 Authentication Key。
# Key（密钥内容）：把刚才复制的那一长串代码粘贴到这里。
# 点击 Add SSH key 保存（可能需要你输入一下 GitHub 密码确认）。

# 第四步：测试连接
# 回到 WSL 终端，输入以下命令测试是否成功：

# ssh -T git@github.com

# 第一次连接会问你是否信任该主机 (Are you sure you want to continue connecting?)，输入 yes 并回车。
# 如果看到类似 Hi your_username! You've successfully authenticated... 的提示，就大功告成了！你可以重新去克隆（Clone）你的代码了。