# Netflix DevSecOps Platform on Azure AKS

[![Azure AKS](https://img.shields.io/badge/Azure-AKS-0078D4?style=flat-square&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com)
[![Live Demo](https://img.shields.io/badge/🌐-Live_Demo-E50914?style=flat-square)](https://netflix.devopsbliss.online)
[![GitHub](https://img.shields.io/badge/GitHub-Repo-181717?style=flat-square&logo=github)](https://github.com/Ritacloud23/azure-aks-netflix-deployment)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

**A production-grade, cloud-native deployment of a Netflix clone on Azure Kubernetes Service**

*Terraform · Docker · AKS · GitHub Actions · Trivy · Snyk · ArgoCD · Prometheus · Grafana*

</div>



## Languages

![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![HCL](https://img.shields.io/badge/HCL-844FBA?style=for-the-badge&logo=terraform&logoColor=white)
![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white)
![CSS](https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![HTML](https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![Dockerfile](https://img.shields.io/badge/Dockerfile-2496ED?style=for-the-badge&logo=docker&logoColor=white)

## Services

![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge&logo=mongodb&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)

> A production-grade, cloud-native deployment of a Netflix clone on **Azure Kubernetes Service (AKS)** - built from infrastructure provisioning to live domain with SSL, security scanning, GitOps, and full observability.

---

## 🌐 Live URLs

| Service | URL |
|---------|-----|
|  Frontend | [https://netflix.devopsbliss.online](https://netflix.devopsbliss.online) |
|  Backend API | [https://api.devopsbliss.online/api/v1/movies](https://api.devopsbliss.online/api/v1/movies) |
|  GitHub Repo | [github.com/Ritacloud23/azure-aks-netflix-deployment](https://github.com/Ritacloud23/azure-aks-netflix-deployment) |

---

##  Architecture Overview

```
Internet
   │
   ▼
Namecheap DNS (devopsbliss.online)
   │
   ▼
Azure Load Balancer (20.253.125.113)
   │
   ▼
NGINX Ingress Controller (ingress-nginx namespace)
   │                          │
   ▼                          ▼
netflix.devopsbliss.online   api.devopsbliss.online
   │                          │
   ▼                          ▼
React Frontend Pods (x2)    Spring Boot Backend Pods (x2)
                                         │
                                         ▼
                                  MongoDB Atlas
                                  (netflix-cluster)
```

---

##  Tech Stack

| Layer | Technology | Details |
|-------|-----------|---------|
| **Frontend** | React 18 | CRA, served via `serve`, Dockerized |
| **Backend** | Spring Boot 3 (Java 17) | REST API, Maven build, port 8080 |
| **Database** | MongoDB Atlas | Cloud-hosted free tier |
| **Container Registry** | Azure ACR | `netflixacrrita.azurecr.io` |
| **Orchestration** | Azure AKS | 3-node cluster, K8s v1.34.4, autoscaling |
| **IaC** | Terraform | Modular structure (resource-group, acr, aks) |
| **CI/CD** | GitHub Actions | 4-stage DevSecOps pipeline |
| **Security** | Trivy + Snyk | Container + dependency scanning |
| **GitOps** | ArgoCD | Automated sync from GitHub |
| **Monitoring** | Prometheus + Grafana | Full cluster observability |
| **Ingress** | NGINX Ingress Controller | Helm-deployed, handles routing |
| **SSL** | cert-manager + Let's Encrypt | Auto-issued TLS certificates |
| **DNS** | Namecheap | `devopsbliss.online` |

---

## 📁 Project Structure

```
azure-aks-netflix-deployment/
├── main.tf                          # Root Terraform — calls all modules
├── variables.tf                     # Root variables
├── outputs.tf                       # Root outputs (IPs, URLs, commands)
├── terraform.tfvars                 # Actual values (gitignored)
├── .trivyignore                     # Known CVEs documented and ignored
├── SECURITY.md                      # Security vulnerability report
│
├── modules/
│   ├── resource-group/
│   │   ├── main.tf                  # Azure Resource Group
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── acr/
│   │   ├── main.tf                  # Azure Container Registry
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── aks/
│       ├── main.tf                  # AKS Cluster + AcrPull role assignment
│       ├── variables.tf
│       └── outputs.tf
│
├── k8s/
│   ├── backend-deployment.yaml      # Spring Boot deployment + LoadBalancer
│   ├── frontend-deployment.yaml     # React deployment + LoadBalancer
│   ├── cluster-issuer.yaml          # Let's Encrypt ClusterIssuer
│   └── ingress.yaml                 # NGINX Ingress + TLS rules
│
├── netflix_backend/                 # Spring Boot source code
│   ├── Dockerfile                   # Multi-stage Alpine build
│   ├── pom.xml
│   ├── _data/movies.json            # Seed data (10 movies)
│   └── src/
│
├── netflix_frontend/                # React source code
│   ├── Dockerfile
│   ├── src/api/axiosConfig.js       # Backend URL config
│   └── src/
│
└── .github/
    └── workflows/
        └── devsecops-pipeline.yml   # 4-stage CI/CD pipeline
```

---

##  Deployment Phases

### Phase 1 - Infrastructure with Terraform

All Azure infrastructure was provisioned using a **modular Terraform structure** - not a flat file - keeping each resource independently reusable and testable.

**Resources provisioned:**
- Azure Resource Group (`rg-netflix-app`, East US)
- Azure Container Registry - `netflixacrrita.azurecr.io` (Standard SKU)
- AKS Cluster - `aks-netflix-cluster` (3 nodes, K8s v1.34.4, autoscaling 3–6)
- AcrPull Role Assignment — AKS can pull images from ACR without storing credentials

```bash
# Authenticate to Azure
az login --tenant <tenant-id>

# Provision everything
terraform init
terraform plan
terraform apply

# Connect kubectl
az aks get-credentials --resource-group rg-netflix-app --name aks-netflix-cluster
kubectl get nodes
```

**Result:** 3 nodes in `Ready` state, all running Kubernetes v1.34.4.

---

### Phase 2 - Containerization & Push to ACR

**Backend (Spring Boot):**

The Dockerfile was refactored from a vulnerable `ubuntu` base to a hardened **multi-stage Alpine build** — reducing the attack surface and image size significantly.

```dockerfile
FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY application.properties /app/src/main/resources/application.properties
COPY ./src /app/src
COPY ./pom.xml /app
RUN mvn -f /app/pom.xml clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**Frontend (React):**

Updated `axiosConfig.js` to use the domain instead of a hardcoded IP — enabling HTTPS compatibility:

```javascript
export default axios.create({
    baseURL: 'https://api.devopsbliss.online',
    headers: { 'Content-Type': 'application/json' },
});
```

**Build & Push:**

```bash
az acr login --name netflixacrrita

# Backend
docker build -t netflixacrrita.azurecr.io/netflix-backend:latest ./netflix_backend
docker push netflixacrrita.azurecr.io/netflix-backend:latest

# Frontend
docker build -t netflixacrrita.azurecr.io/netflix-frontend:latest ./netflix_frontend
docker push netflixacrrita.azurecr.io/netflix-frontend:latest
```

---

### Phase 3 - Deploy to AKS

```bash
# Create namespace
kubectl create namespace netflix

# Store MongoDB credentials as a Kubernetes secret (never hardcoded)
kubectl create secret generic mongodb-secret \
  --namespace netflix \
  --from-literal=MONGO_URI="mongodb+srv://user:pass@netflix-cluster.zhnqp5b.mongodb.net/moviedb"

# Deploy backend and frontend
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml

# Verify
kubectl get pods -n netflix
kubectl get svc -n netflix
```

**Live service endpoints:**

| Service | External IP | Port |
|---------|-------------|------|
| Backend | 172.214.28.235 | 8080 |
| Frontend | 52.249.201.65 | 80 |

**Seed the database:**

```bash
mongoimport \
  --uri "mongodb+srv://user:pass@netflix-cluster.zhnqp5b.mongodb.net/moviedb" \
  --collection movies \
  --file netflix_backend/_data/movies.json \
  --jsonArray
```

---

### Phase 4 - DevSecOps Pipeline (GitHub Actions)

A 4-stage CI/CD pipeline runs on every push to `main`. Security scanning happens **before** any image reaches production.

```
Push to main
     │
     ▼
┌─────────────────────┐
│  Snyk Container Scan │  ← Dependency vulnerability scan
└─────────────────────┘
     │
     ▼
┌──────────────────────────┐   ┌───────────────────────────┐
│ Build + Trivy Scan       │   │ Build + Trivy Scan        │
│ Backend → Push to ACR    │   │ Frontend → Push to ACR    │
└──────────────────────────┘   └───────────────────────────┘
     │                                    │
     └──────────────┬─────────────────────┘
                    ▼
          ┌──────────────────┐
          │  Deploy to AKS   │  ← kubectl apply
          └──────────────────┘
```

**GitHub Secrets configured:**

| Secret | Purpose |
|--------|---------|
| `SNYK_TOKEN` | Snyk API authentication |
| `ACR_USERNAME` | Azure Container Registry login |
| `ACR_PASSWORD` | Azure Container Registry password |
| `KUBE_CONFIG` | Base64-encoded kubeconfig for AKS |
| `MONGO_URI` | MongoDB Atlas connection string |

**Security findings documented:**

| CVE | Severity | Component | Remediation |
|-----|----------|-----------|-------------|
| CVE-2023-20860 | CRITICAL | Spring Framework 6.0.3 | Upgrade to Spring Boot 3.1+ |
| CVE-2025-24813 | CRITICAL | Apache Tomcat | Upgrade embedded Tomcat |
| CVE-2026-29145 | CRITICAL | Apache Tomcat | Upgrade embedded Tomcat |
| CVE-2023-28154 | CRITICAL | webpack 5.75.0 | Upgrade to webpack 5.76.0+ |
| CVE-2025-7783 | CRITICAL | form-data 3.0.1 | Upgrade to 3.0.4+ |

> All CVEs are documented in [`SECURITY.md`](./SECURITY.md) and tracked in `.trivyignore` with remediation plans.

---

### Phase 5 — Domain, SSL & Ingress

**NGINX Ingress Controller:**

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=LoadBalancer
```

**cert-manager (Let's Encrypt):**

```bash
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true
```

**DNS Records (Namecheap):**

| Type | Host | Value |
|------|------|-------|
| A Record | `netflix` | `20.253.125.113` |
| A Record | `api` | `20.253.125.113` |

**Key troubleshooting resolved:**

The Azure Load Balancer health probe was using `/` as the check path — but NGINX returns `404` on `/`, not `200`. This caused the LB to silently mark all backends as unhealthy and drop all traffic, which also blocked Let's Encrypt from completing the ACME HTTP-01 challenge. Fixed by updating the probe path to `/healthz`.

```bash
az network lb probe update \
  --resource-group MC_rg-netflix-app_aks-netflix-cluster_eastus \
  --lb-name kubernetes \
  --name <probe-name> \
  --request-path //healthz
```

> Note: `//healthz` (double slash) is required in Git Bash on Windows to prevent path expansion to `C:/Program Files/Git/healthz`.

---

### Phase 6 - GitOps with ArgoCD

ArgoCD was installed and configured to watch the GitHub repository and automatically sync changes to the AKS cluster.

```bash
# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Connect repo and set target revision
kubectl edit application netflix-app -n argocd
# Set: repoURL to correct GitHub URL
# Set: targetRevision to main
```

**Issue resolved:** ArgoCD was showing `revision HEAD must be resolved` because it was pointing to the wrong repo URL. Fixed by editing the application manifest and force-pushing a cleaned Git history after removing a large `argocd.exe` binary that had been accidentally committed.

**Final ArgoCD status:**
```
App Health:  Healthy ✅
Sync Status: Synced  ✅
Last Sync:   Sync OK ✅
```

---

### Phase 7 - Monitoring with Prometheus & Grafana

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace
```

**Dashboards configured:**
- Cluster resource usage (CPU, memory, disk)
- Namespace-level metrics (`netflix` namespace)
- Pod health and restart tracking
- Custom `HighCPUUsage` PrometheusRule alert — tested by generating load on the backend pod

---

##  Prerequisites

```bash
# Verify all tools are installed
az --version          # Azure CLI 2.85.0+
terraform --version   # 1.5.0+
kubectl version       # client
helm version          # 3.x
docker --version      # 20.x+
```

---

## ⚡ Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/Ritacloud23/azure-aks-netflix-deployment.git
cd azure-aks-netflix-deployment

# 2. Login to Azure
az login

# 3. Provision infrastructure
cd terraform
terraform init && terraform apply

# 4. Connect kubectl
az aks get-credentials --resource-group rg-netflix-app --name aks-netflix-cluster

# 5. Create namespace and secrets
kubectl create namespace netflix
kubectl create secret generic mongodb-secret \
  --namespace netflix \
  --from-literal=MONGO_URI="<your-mongodb-uri>"

# 6. Deploy to AKS
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml

# 7. Verify
kubectl get pods -n netflix
kubectl get svc -n netflix
```

---

##  Key Challenges & Solutions

| Challenge | Root Cause | Solution |
|-----------|-----------|---------|
| K8s version error | v1.28 deprecated in East US | Upgraded to v1.34 (region default) |
| ACR role assignment failed | Wrong scope (login_server vs resource ID) | Used `azurerm_container_registry.this.id` |
| Docker build failure | `application.properties` not in project root | Copied file to root before build |
| MongoDB SSL timeout | Atlas IP whitelist blocking AKS egress IPs | Added `0.0.0.0/0` to Atlas Network Access |
| Git submodule issues | Nested repos treated as submodules | Removed `.git` from nested folders, force-added |
| Trivy blocking pipeline | Vulnerable `ubuntu` base image | Switched to `eclipse-temurin:17-jre-alpine` |
| Port 80 blocked | Azure LB health probe returning 404 | Updated probe path to `/healthz` |
| SSL cert failing | `ssl-redirect: true` blocking HTTP-01 challenge | Disabled redirect during cert issuance, re-enabled after |
| Mixed Content error | Frontend calling HTTP API from HTTPS page | Updated `axiosConfig.js` to use `https://api.devopsbliss.online` |
| ArgoCD sync error | Wrong repo URL + `HEAD` instead of `main` | Fixed app manifest, cleaned Git history |
| Git Bash path expansion | `/healthz` expanded to Windows path | Used `//healthz` double-slash prefix |

---

##  Best Practices Applied

- **Modular Terraform** - each resource is an independent, reusable module
- **Kubernetes Secrets** - sensitive data never hardcoded in manifests
- **Least Privilege** - AcrPull role assigned via Terraform, not admin credentials
- **Multi-stage Docker builds** - smaller, hardened images with minimal attack surface
- **Security-first pipeline** - Snyk + Trivy scan before every deployment
- **GitOps** - all changes flow through Git, ArgoCD syncs automatically
- **Environment variables** - no hardcoded IPs or URLs in application code
- **Documented CVEs** - all vulnerabilities tracked with remediation plans

---

##  Pipeline Results

```
✅ Snyk Dependency Scan       PASSED   (50s)
✅ Build & Scan Backend        PASSED   (56s)
✅ Build & Scan Frontend       PASSED   (2m 8s)
✅ Deploy to AKS               PASSED   (8s)

Total Duration: 3m 15s
Status: SUCCESS
```

---

## Project Screenshots

### Azure Resource Group
![Azure Resource Group](images/Azure%20Resource%20Group.jpeg)

### AKS Cluster with 3 Ready Nodes
![AKS Cluster](images/AKS%20Cluster.jpeg)

### ACR Repository
![ACR Repo](images/ACR%20repo%20(Backend%20+%20Frontend).jpeg)

### GitHub Actions Pipeline
![GitHub Action](images/GitHub%20Action.jpeg)

### ArgoCD Healthy + Synced
![ArgoCD](images/ArgoCD.jpeg)

### Grafana Dashboard
![Grafana Dashboard](images/Grafana-Dashboard.jpeg)

### Live Application
![Live App](images/Live%20app%20at%20https-netflix.devopsbliss.online.jpeg)

---

##  Author

**Rita** - Cloud & DevOps Engineer

[![GitHub](https://img.shields.io/badge/GitHub-Ritacloud23-181717?style=flat&logo=github)](https://github.com/Ritacloud23)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/rita-nnenna)

---

##  License

This project is open source and available under the [MIT License](LICENSE).

---

> *"Infrastructure is not an afterthought. It's the foundation everything else stands on."*
