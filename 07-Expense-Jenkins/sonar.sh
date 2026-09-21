====================================================================
  SONARQUBE INSTANCE - EBS DISK EXPAND & DOCKER STORAGE FIX
====================================================================

# Step 1: EBS Volume Partition & LVM Root Volume Expand
sudo growpart /dev/xvda 4 || sudo growpart /dev/nvme0n1 4
sudo pvresize /dev/xvda4 || sudo pvresize /dev/nvme0n1p4
sudo lvextend -l +100%FREE /dev/mapper/RootVG-rootVol
sudo xfs_growfs /

# Step 2: Stop Docker Services
sudo systemctl stop docker docker.socket containerd

# Step 3: Create Storage Directory in Root Partition (/docker-data)
sudo mkdir -p /docker-data/lib-docker /docker-data/lib-containerd

# Step 4: Remove Old /var Directories & Create Symlinks to Root
sudo rm -rf /var/lib/docker /var/lib/containerd
sudo ln -sf /docker-data/lib-docker /var/lib/docker
sudo ln -sf /docker-data/lib-containerd /var/lib/containerd

# Step 5: Restart Docker & Containerd Services
sudo systemctl start containerd
sudo systemctl start docker

# Step 6: Set Elasticsearch Sysctl Limit (SonarQube Prerequisite)
sudo sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf

# Step 7: Run SonarQube Container
docker run -d --name sonarqube -p 9000:9000 sonarqube:community