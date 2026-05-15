#!/bin/sh
# Send Xray config to Telegram after codespace starts

BOT_TOKEN="8681855503:AAHzuqLDAGSRjoMr8C321eRd7HJVbkESarA"
CHAT_ID="7605025529"

# Wait a moment to ensure CODESPACE_NAME is set
sleep 3

CONFIG="vless://2166797c-f912-4a24-a467-c5d0c216cc2d@94.130.50.12:443?encryption=none&security=tls&type=xhttp&mode=packet-up&sni=${CODESPACE_NAME}-443.app.github.dev&path=%2F#g2ray"

MESSAGE="🟢 *g2ray کانفیگ جدید آماده است*

\`\`\`
${CONFIG}
\`\`\`

📋 کافیه این لینک رو کپی کنی و توی کلاینت وارد کنی."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  -d text="${MESSAGE}" \
  -d parse_mode="Markdown" \
  > /dev/null 2>&1
