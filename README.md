# Jenkin-CICD-project
This is a cicd project using jenkins , docker 

---

# Jenkins Installation Guide (Linux, Windows, macOS)

Jenkins is an open-source automation server used to build, test, and deploy software.

---

## Install Jenkins on Ubuntu (Debian-based Linux)

### Step 1: Install Java (Jenkins requires Java 11 or 17)
```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
```

### Step 2: Add Jenkins GPG key and repo
```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

### Step 3: Install Jenkins
```bash
sudo apt update
sudo apt install jenkins -y
```

### Step 4: Start and enable Jenkins
```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

### Step 5: Access Jenkins
Open in browser:
```
http://localhost:8080
```

To get the initial admin password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## Install Jenkins on Windows

### Option 1: Windows Installer

1. Download the Jenkins Windows installer from:  
   https://www.jenkins.io/download/

2. Run the `.msi` installer and follow the setup wizard.

3. After installation, Jenkins will start as a Windows service.

4. Open a browser and go to:
```
http://localhost:8080
```

5. Get the admin password from:
```
C:\Program Files\Jenkins\secrets\initialAdminPassword
```

---

## Install Jenkins on macOS

### Using Homebrew
```bash
brew install jenkins-lts
```

### Start Jenkins
```bash
brew services start jenkins-lts
```

### Access Jenkins
```
http://localhost:8080
```

To get the initial password:
```bash
cat /Users/$(whoami)/.jenkins/secrets/initialAdminPassword
```

---

## Optional: Uninstall Jenkins

### Ubuntu
```bash
sudo apt remove jenkins -y
sudo apt autoremove -y
```

### macOS
```bash
brew services stop jenkins-lts
brew uninstall jenkins-lts
```

### Windows
Use “Add or Remove Programs” to uninstall Jenkins.

---

## Resources

- Jenkins Docs: https://www.jenkins.io/doc
- Jenkins GitHub: https://github.com/jenkinsci/jenkins
- Jenkins Plugins: https://plugins.jenkins.io/

---

# Connect to GitHub Using SSH

Follow these steps to set up SSH authentication between your local machine and GitHub.

---

## Step 1: Generate SSH Key

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Press Enter to accept the default file location (`~/.ssh/id_rsa`), and optionally set a passphrase.

---


## Step 2: Add SSH Key to GitHub

Copy your public key:

```bash
cat ~/.ssh/id_rsa.pub
```

1. Go to GitHub → Settings → SSH and GPG Keys → New SSH Key
2. Paste the key
3. Save

---

## Step 3: Test the Connection

```bash
ssh -T git@github.com
```

You should see:

```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

---
