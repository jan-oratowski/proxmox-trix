wget https://github.com/shoenig/ssh-key-sync/releases/download/v1.7.1/ssh-key-sync_1.7.1_linux_amd64.tar.gz
tar -C /usr/local/bin -xf ssh-key-sync_1.7.1_linux_amd64.tar.gz
touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
/usr/local/bin/ssh-key-sync --github-user jan-oratowski --authorized-keys /root/.ssh/authorized_keys
echo "/usr/local/bin/ssh-key-sync --github-user jan-oratowski --authorized-keys /root/.ssh/authorized_keys" > ssh-key-sync.sh
chmod +x ssh-key-sync.sh
echo "1 22 * * * /root/ssh-key-sync.sh" | crontab -