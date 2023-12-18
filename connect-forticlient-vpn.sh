#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connect Forticlient VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon forticlient_icon.png
# @raycast.argument1 { "type": "text", "placeholder": "Input forti token" }

# Documentation:
# @raycast.description auto connect forticlient vpn
# @raycast.author yangqian
# @raycast.authorURL https://raycast.com/yangqian

LOG_FILE="output.log"
OTP="$1"

> "$LOG_FILE"

if [ ! -f ".cli_config" ]; then
  echo "Error: .cli_config file not found." >> "$LOG_FILE"
  terminal-notifier -message "❌ Please setup vpn config" -title "Forti Client VPN" -sender com.fortinet.FortiClient
  exit 1
fi

# 启动 VPN 连接，并将输出重定向到日志文件
cat .ROOT_PASSWORD | sudo -S nohup openfortivpn -c .cli_config -o "$OTP" >> "$LOG_FILE" 2>&1 &

# 等待足够长的时间以确保日志文件中的内容已经更新
sleep 3

# 检查日志文件中是否包含 ERROR 或 Failed
if grep -E "ERROR|Failed|incorrect" "$LOG_FILE"; then
  # 获取最后一条包含 "ERROR" 的行
  LAST_ERROR_LINE=$(grep -E "ERROR|Failed|incorrect" "$LOG_FILE" | tail -1)

  # 提取错误消息
  ERROR_MSG=$(echo "$LAST_ERROR_LINE" | cut -d' ' -f3-)

  # 发送连接失败的通知，包含最后一条错误消息
  terminal-notifier -message "❌ VPN Connection Failed" -subtitle "$ERROR_MSG" -title "Forti Client VPN" -sender com.fortinet.FortiClient
  echo "VPN Connection Failed"
  echo "$ERROR_MSG"
  exit 1
else
  # 发送连接成功的通知
  terminal-notifier -message "✅ VPN Connected Successfully" -title "Forti Client VPN" -sender com.fortinet.FortiClient
  echo "VPN Connected Successfully"
fi