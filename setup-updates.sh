## sets up unattended upgrades, requires some changes in 50unattended-upgrades:
## - uncomment origins
## - fill in e-mail
## - set up auto cleanup

sudo apt update
sudo apt install unattended-upgrades
sudo nano -w /etc/apt/apt.conf.d/50unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
sudo systemctl status unattended-upgrades.service