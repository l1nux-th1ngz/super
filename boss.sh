#!/bin/bash

# Switch to root user
su root <<'EOF'
# Install sudo
apt-get install -y sudo

# Add user to the sudo group
sudo usermod -a -G sudo slim

# Add user 'slim' to the sudo group
usermod -aG sudo slim

# Append sudoers configuration
echo 'slim ALL=(ALL) NOPASSWD: /usr/bin/apt-get' > /etc/sudoers.d/slim-apt-get
echo 'slim ALL=(ALL) NOPASSWD: /bin/systemctl/*' > /etc/sudoers.d/slim-systemctl
echo 'slim ALL=(ALL) NOPASSWD: /usr/*' > /etc/sudoers.d/slim-usr
echo 'slim ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/slim-all

EOF
