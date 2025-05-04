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

# To connect git,ubuntu server to jenkins

jenkins -> freestyle project -> github link -> source code management (select git) -> give repo url -> add credentials -> kind (ssh username with private key) and (username same as ubuntu's username) and ID random name -> ADD ->select branch (same as git's) -> SAVE

then BUILD NOW in jenkins

---

# For to run docker command in linux using jenkins

Inside jenkins job go to configure then in build steps add a build step and select exhicute shell the paste these command

```bash
docker build . -t todo-node-app
docker run -d --name todo-node-app-1 -p 8000:8000 todo-node-app
```

then SAVE changes after that build now

and also shell commands are given in shell.sh

---

# GitHub Webhook Integration with Jenkins

This guide explains how to connect a GitHub repository to Jenkins using a webhook to trigger builds automatically when code is pushed.

---

## Prerequisites

- Jenkins is installed and running (publicly accessible or via ngrok for testing)
- Jenkins Git and GitHub plugins installed
- A GitHub repository
- GitHub and Jenkins integrated using SSH or HTTPS (already working build)

---

## Step 1: Enable GitHub Integration in Jenkins Project

1. Go to Jenkins → Open your project → **Configure**
2. Scroll to **Build Triggers**
3. Check **"GitHub hook trigger for GITScm polling"**
4. Click **Save**

---

## Step 2: Ensure Jenkins Can Receive Webhooks

Your Jenkins URL **must be accessible by GitHub**:

- If public: Use your server IP/domain
- If local: Use `ngrok` to expose Jenkins

Example:
```bash
ngrok http 8080
```
Use the generated `https://xyz.ngrok.io` URL for webhook.

---

## Step 3: Configure Webhook in GitHub

1. Go to your GitHub repository → **Settings** → **Webhooks**
2. Click **"Add webhook"**
3. Set:
   - **Payload URL**: `http://<your-jenkins-url>/github-webhook/`  
     _(use https and ngrok if testing locally)_
   - **Content type**: `application/json`
   - **Secret**: (optional)
   - **Event trigger**: Choose “Just the push event”
4. Click **Add webhook**

---

## Step 4: Validate Webhook

1. Push code to your GitHub repository
2. Jenkins should automatically start a build
3. Go to Jenkins → Project → **Build History** to see if it was triggered
4. On GitHub → **Webhook** → View **Recent Deliveries** → You should see status as "200"

---

## Troubleshooting

- Jenkins must run on port 80 or 8080 (or be properly exposed)
- Check firewall/NAT if hosted on a private server
- Verify Jenkins URL is correct in the webhook
- Use the **GitHub plugin** in Jenkins, not just the Git plugin

---

## References

- Jenkins GitHub Plugin: https://plugins.jenkins.io/github/
- GitHub Webhooks: https://docs.github.com/en/webhooks
- Ngrok: https://ngrok.com/


