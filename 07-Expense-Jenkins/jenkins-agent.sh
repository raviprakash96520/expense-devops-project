====================================================================
  JENKINS AGENT INSTANCE (agent-1) - /home & ROOT LVM EXPAND
====================================================================

# Step 1: Volume Partition & Physical Volume Expand
sudo growpart /dev/xvda 4 || sudo growpart /dev/nvme0n1 4
sudo pvresize /dev/xvda4 || sudo pvresize /dev/nvme0n1p4

# Step 2: /home Logical Volume ni Free Space తో Extend చేయండి
sudo lvextend -L +10G /dev/mapper/RootVG-homeVol || sudo lvextend -l +100%FREE /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home

# Step 3: మిగిలిన Unallocated Space ఉంటే Root (/) కి కూడా ఇవ్వండి
sudo lvextend -l +100%FREE /dev/mapper/RootVG-rootVol || true
sudo xfs_growfs /

# Step 4: Java 17 Install (Jenkins Agent Connection కోసం Prerequisite)
sudo dnf install -y java-17-openjdk-devel

# Step 5: Disk Space Verify చేయండి
df -h /home /