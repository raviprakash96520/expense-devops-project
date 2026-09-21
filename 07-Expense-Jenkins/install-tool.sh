#!/bin/bash

# Errors వస్తే script ఆగిపోవడానికి
set -e

echo "=========================================="
echo "1. System Updates & Node.js Setup (RHEL 9)"
echo "=========================================="
sudo dnf update -y
sudo dnf module reset nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install -y git unzip curl wget python3-pip nodejs

echo "=========================================="
echo "2. Docker Installation & Permissions"
echo "=========================================="
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io

sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user

echo "=========================================="
echo "3. AWS CLI v2 Installation"
echo "=========================================="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o -q awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws

echo "=========================================="
echo "4. GitLeaks Installation"
echo "=========================================="
wget -q https://github.com/gitleaks/gitleaks/releases/download/v8.18.2/gitleaks_8.18.2_linux_x64.tar.gz
tar -zxvf gitleaks_8.18.2_linux_x64.tar.gz gitleaks
sudo mv -f gitleaks /usr/local/bin/
rm -f gitleaks_8.18.2_linux_x64.tar.gz

echo "=========================================="
echo "5. Snyk CLI Installation & Global Path Setup"
echo "=========================================="
sudo npm install -g snyk
sudo ln -sf $(which snyk || echo "/usr/bin/snyk") /usr/local/bin/snyk

echo "=========================================="
echo "6. SonarScanner CLI Installation"
echo "=========================================="
SONAR_SCANNER_VERSION="5.0.1.3006"
wget -q "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"
unzip -o -q "sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"
sudo rm -rf /opt/sonar-scanner
sudo mv "sonar-scanner-${SONAR_SCANNER_VERSION}-linux" /opt/sonar-scanner
sudo ln -sf /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
rm -f "sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"

echo "=========================================="
echo "7. Checkov Installation"
echo "=========================================="
pip3 install checkov || pip3 install --break-system-packages checkov

echo "=========================================="
echo "8. Trivy Security Scanner Installation"
echo "=========================================="
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sudo sh -s -- -b /usr/bin

echo "=========================================="
echo "9. Verifying All Tool Installations"
echo "=========================================="
echo -n "GitLeaks:      " && gitleaks version
echo -n "Snyk CLI:      " && snyk --version
echo -n "SonarScanner:  " && sonar-scanner --version | grep "SonarScanner"
echo -n "Checkov:       " && checkov --version
echo -n "Trivy Scanner: " && trivy --version | head -n 1
echo -n "Docker Engine: " && docker --version
echo -n "AWS CLI:       " && aws --version

echo "=========================================="
echo " ALL TOOLS INSTALLED & VERIFIED SUCCESSFULLY! "
echo "=========================================="

sudo dnf install -y java-21-openjdk-devel