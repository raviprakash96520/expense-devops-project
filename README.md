# Expense Management System - DevOps Project

A **3-Tier Architecture** project demonstrating both **Manual** and **Automated** deployment approaches for a full-stack expense management application.

---

## 📋 Project Overview

This project showcases a complete DevOps workflow from manual deployment to Infrastructure as Code (IaC) and CI/CD automation.

### Architecture Layers:
- **Frontend Tier** (Node.js/React) - Running on EC2-1
- **Backend Tier** (Java/Python API) - Running on EC2-2  
- **Database Tier** (MySQL) - Running on EC2-3

---

## 📁 Directory Structure

```
expense-devops-project/
│
├── 01-manual-deployment/          # Manual deployment steps & scripts
│   ├── 01-frontend-setup.md       # Frontend deployment guide
│   ├── 02-backend-setup.md        # Backend deployment guide
│   ├── 03-database-setup.md       # Database deployment guide
│   └── deployment-screenshots/    # Proof of manual deployment
│
├── expense-shell/                 # Shell scripts for automation
│
├── expense-ansible/               # Ansible playbooks (Automated deployment)
│
├── expense-docker/                # Docker configurations (Containerization)
│
├── expense-infra-terraform/       # Terraform IaC (Infrastructure provisioning)
│
├── expense-CICD/                  # CI/CD pipelines (GitHub Actions)
│
├── k8-expense/                    # Kubernetes manifests
│
└── README.md                       # This file
```

---

## 🚀 Deployment Phases

### **Phase 1: Manual Deployment** ✅
Manual setup of each tier with documentation and screenshots.

**Folder:** `01-manual-deployment/`

**Steps:**
1. Set up 3 EC2 instances (Frontend, Backend, Database)
2. Install dependencies on each instance
3. Deploy applications manually
4. Configure networking and security groups
5. Take screenshots as proof
6. Document the process

**Timeline:** [Add dates after completion]

---

### **Phase 2: Automated Deployment** (Coming Soon)
Using shell scripts and Ansible for automated deployments.

**Folder:** `expense-shell/` & `expense-ansible/`

---

### **Phase 3: Infrastructure as Code** (Coming Soon)
Using Terraform to provision infrastructure automatically.

**Folder:** `expense-infra-terraform/`

---

### **Phase 4: Containerization** (Coming Soon)
Using Docker to containerize applications.

**Folder:** `expense-docker/`

---

### **Phase 5: CI/CD Pipeline** (Coming Soon)
Using GitHub Actions for automated testing and deployment.

**Folder:** `expense-CICD/`

---

### **Phase 6: Container Orchestration** (Coming Soon)
Using Kubernetes for production deployments.

**Folder:** `k8-expense/`

---

## 📖 Manual Deployment Documentation

### **Step 1: Frontend Deployment**
See: `01-manual-deployment/01-frontend-setup.md`

**What you need to do:**
- SSH into Frontend EC2
- Install Node.js & npm
- Clone/deploy React application
- Start the frontend service
- Take screenshots

---

### **Step 2: Backend Deployment**
See: `01-manual-deployment/02-backend-setup.md`

**What you need to do:**
- SSH into Backend EC2
- Install Java/Python runtime
- Deploy backend application
- Configure database connection
- Start the backend service
- Take screenshots

---

### **Step 3: Database Deployment**
See: `01-manual-deployment/03-database-setup.md`

**What you need to do:**
- SSH into Database EC2
- Install MySQL
- Create databases and tables
- Set up users and permissions
- Take screenshots

---

## 📸 Proof Documentation

All screenshots should be saved in: `01-manual-deployment/deployment-screenshots/`

**Required Screenshots:**
- ✅ EC2 instances running
- ✅ SSH connection to each instance
- ✅ Frontend application loaded in browser
- ✅ Backend API responding
- ✅ Database connection working
- ✅ All three tiers communicating

---

## ✅ Deployment Checklist

### Frontend:
- [ ] EC2 instance running
- [ ] Node.js installed
- [ ] Application deployed
- [ ] Port 3000 accessible
- [ ] Screenshots taken

### Backend:
- [ ] EC2 instance running
- [ ] Java/Python installed
- [ ] Application deployed
- [ ] Port 8080 accessible
- [ ] Screenshots taken

### Database:
- [ ] EC2 instance running
- [ ] MySQL installed
- [ ] Database created
- [ ] User permissions set
- [ ] Screenshots taken

---

## 🔄 How to Use This Repository

### For Manual Deployment:
```bash
# Read manual deployment guides
cd 01-manual-deployment/
cat 01-frontend-setup.md
cat 02-backend-setup.md
cat 03-database-setup.md

# After following steps, add screenshots
# Save them in: deployment-screenshots/
```

### For Future Automated Deployments:
```bash
# After manual deployment, use automation
cd expense-ansible/
# Run Ansible playbooks to automate the process
```

---

## 📝 Documentation Template

For each deployment step, document:
1. **Command executed**
2. **Expected output**
3. **Screenshot** (showing successful execution)
4. **Timestamp** (when completed)
5. **Notes/Issues** (if any)

---

## 🛠️ Technology Stack

| Layer | Technology | Port |
|-------|-----------|------|
| Frontend | Node.js/React | 3000 |
| Backend | Java/Python | 8080 |
| Database | MySQL | 3306 |
| Infrastructure | AWS EC2 | - |
| Deployment | Manual → Ansible → Terraform | - |
| Containerization | Docker | - |
| Orchestration | Kubernetes | - |
| CI/CD | GitHub Actions | - |

---

## 📞 Support & Next Steps

1. ✅ **Phase 1 (Manual):** Complete manual deployment with screenshots
2. 🔜 **Phase 2 (Automation):** Convert to shell scripts & Ansible
3. 🔜 **Phase 3 (IaC):** Create Terraform configurations
4. 🔜 **Phase 4 (Docker):** Containerize applications
5. 🔜 **Phase 5 (CI/CD):** Set up GitHub Actions pipeline
6. 🔜 **Phase 6 (K8s):** Deploy to Kubernetes cluster

---

## 👨‍💻 Author
**raviprakash96520**

---

## 📅 Last Updated
2026-08-31

---

**Good Luck! Follow the manual deployment guides step-by-step and take screenshots as proof of each completed step.** 🚀
