#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disconnect Forticlient VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon forticlient_icon.png

# Documentation:
# @raycast.description auto disconnect forticlient vpn
# @raycast.author yangqian
# @raycast.authorURL https://raycast.com/yangqian

# 使用 pgrep 查找 openfortivpn 进程的 PID
VPN_PID=$(pgrep openfortivpn)

# 如果找到了进程，尝试杀死它
if [ -n "$VPN_PID" ]; then
    echo "Terminating VPN connection..."
    cat .ROOT_PASSWORD | sudo -S -p "" kill $VPN_PID

    # 等待一会儿并检查进程是否已经被终止
    sleep 1
    if pgrep openfortivpn > /dev/null; then
        echo "Failed to disconnect VPN."
        terminal-notifier -message "❌ Failed to Disconnected successfully." -title "FortiClient VPN" -sender com.fortinet.FortiClient
        exit 1
    else
        echo "VPN disconnected successfully."
        terminal-notifier -message "✅ Disconnected successfully." -title "FortiClient VPN" -sender com.fortinet.FortiClient
    fi
else
    echo "No VPN connection found."
    terminal-notifier -message "[Warning] No VPN connection found" -title "FortiClient VPN" -sender com.fortinet.FortiClient
    exit 1
fi

