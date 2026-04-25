# 🎬 Netflix Backend

**By DigitalWitch | Cloud • DevOps • Security**

---

## 📌 Overview

This project is a backend service for a Netflix-style application. It is built using Java and Maven, with MongoDB as the database.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/digitalwitchdemo/netflix_backend.git
cd netflix_backend
```

### 2. Remove Existing Git Configuration

Delete the default `.git` folder to reinitialize the repository under your own account.

```bash
rm -rf .git
```

### 3. Open the Project

Open the `netflix_backend` folder in your preferred IDE (e.g., VS Code).

---

## 🔁 Reinitialize Git Repository

```bash
git init
git add .
git commit -m "Initial commit"
git config user.name "your-github-username"
git config user.email "your-email@example.com"
```

---

## 🔐 Authentication Setup

> ⚠️ Important: Use your GitHub username and a Personal Access Token (PAT) as your password.

1. Generate a **Personal Access Token** from your Git provider.
2. Add your remote repository:

```bash
git remote add origin https://{username}:{personal-access-token}@gitlab.com/{your_username}/{your_repo_name}.git
git branch -M main
git push -u origin main
```

---

## ⚙️ Backend Dependencies

Ensure the following are installed on your system:

* **JDK 17**
* **Maven 3.8+**

### Installation (Ubuntu/Debian)

```bash
sudo apt update -y
sudo apt install openjdk-17-jre-headless -y
sudo apt install maven -y
```

### Verify Installation

```bash
javac --version
java --version
mvn --version
```

---

## 🗄️ Environment Configuration

Before running the application, configure your MongoDB credentials:

**File location:**

```
src/main/java/resources/.env
```

**Add the following:**

```
MONGO_DATABASE=your_database_name
MONGO_CLUSTER=your_cluster_url
```

---

## 🛠️ Build & Run the Application

### 1. Package the Application

```bash
mvn clean package
```

### 2. Run the Application

```bash
java -jar target/{your_artifact_name}.jar
```

---

## 📦 Output

* The compiled `.jar` file will be located in the `/target` directory.

---

## ✅ Notes

* Ensure MongoDB is properly configured and accessible.
* Double-check your environment variables before running.
* Keep your Personal Access Token secure.

---

## 🎓 Final Words

Good luck with your learning and development journey! 🚀

**— Engr. Smart Cares**
