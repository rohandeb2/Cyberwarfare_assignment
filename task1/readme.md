# Task 1 — SSH Configuration

## What I Did
Installed SSH server, created a new user, set up key-based login, and disabled password authentication.

---

## Environment
- OS: Ubuntu 24.04.4 LTS (WSL2)
- SSH Server: OpenSSH
- User created: `rohan_deb`

---

## Steps

**1. Install and start SSH**
```bash
sudo apt update
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
```

**2. Create a new user**
```bash
sudo adduser rohan_deb
```

**3. Generate SSH key pair**
```bash
ssh-keygen -t ed25519 -C "devops-intern"
```
Keys saved at `~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub`

**4. Copy public key to the new user**
```bash
ssh-copy-id rohan_deb@localhost
```

**5. Disable password login**

Edited `/etc/ssh/sshd_config`:
```
PasswordAuthentication no
PubkeyAuthentication yes
```

```bash
sudo systemctl restart ssh
```

**6. Test passwordless login**
```bash
ssh rohan_deb@localhost
```

---

## Output

<div align="center">
  <img src="img/11.png" >
</div>

---

## Result
- SSH server running
- New user `rohan_deb` created
- Key-based login working
- Password authentication disabled
