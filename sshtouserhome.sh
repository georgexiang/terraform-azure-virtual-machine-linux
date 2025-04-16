# 进入 WSL 的 Linux 用户目录
cd ~

# 创建一个安全目录用于 SSH 密钥
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# 把私钥复制进去
cp /mnt/c/gx/azure-workspace/gx-github/terraform-azure-virtual-machine-linux/id_rsa ~/.ssh/
chmod 600 ~/.ssh/id_rsa

# 然后用它连接
ssh -i ~/.ssh/id_rsa adminuser@52.170.4.245
