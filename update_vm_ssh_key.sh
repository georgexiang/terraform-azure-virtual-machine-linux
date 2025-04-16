#!/bin/bash

# ====== 配置项：你自己改下面这些变量 ======
RESOURCE_GROUP="example-resources"
VM_NAME="glt-24"
USERNAME="adminuser"
KEY_PATH="$HOME/.ssh/azure-ed25519-20250416"
# =========================================

# Step 1: 生成 ED25519 密钥对（如果已存在则跳过）
if [[ -f "$KEY_PATH" ]]; then
  echo "✅ SSH key already exists at $KEY_PATH"
else
  echo "🔐 Generating new ED25519 key at $KEY_PATH"
  ssh-keygen -t ed25519 -f "$KEY_PATH" -N ""
fi

# Step 2: 用 Azure CLI 更新虚机上的 SSH 公钥
echo "🚀 Updating SSH key on Azure VM..."
az vm user update \
  --name "$VM_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --username "$USERNAME" \
  --ssh-key-value "$(cat ${KEY_PATH}.pub)"

# Step 3: 提示连接命令
echo ""
echo "✅ SSH key updated successfully!"
echo "👉 You can now connect using:"
echo "ssh -i $KEY_PATH $USERNAME@52.170.4.245"
