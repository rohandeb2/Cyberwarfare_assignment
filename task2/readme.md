# Task 2 — Docker Web App Deployment

## What I Did
Installed Docker, wrote a Dockerfile using nginx, built an image, and ran a container exposed on port 8000.

---

## Environment
- Docker version: 28.x
- Base image: nginx:alpine
- Container name: webapp
- Port: 8000

---

## Files
- `Dockerfile` — builds the image
- `index.html` — the custom web page served by nginx

---

## Steps

**1. Install Docker**
```bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER
newgrp docker

docker --version
```

**2. Create Dockerfile and index.html**
```bash
cd task2
nano Dockerfile
nano index.html
```

**3. Build the image**
```bash
docker build -t my-webapp .
```

**4. Run the container**
```bash
docker run -d --name webapp -p 8000:80 my-webapp
```

**5. Verify**
```bash
docker ps
curl http://localhost:8000
```

---

## Output
<div align="center">
  <img src="img/12.png" >
</div>
<div align="center">
  <img src="img/13.png" >
</div>

## Result
- Docker installed and configured
- Custom image built from Dockerfile
- Container running and app accessible on port 8000
