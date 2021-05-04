# Proxmox-ubuntu-cloudinit-bash
Bash script that uses cloudinit to install a Ubuntu 20.04 vm on proxmox
Downloads newest daily build of Ubuntu Server 20.04
Some simple variables to set vm id, name, size etc.

If you prefer not downloading a new image every time just comment ut the wget and rm part.

## Usage

`wget https://raw.githubusercontent.com/oytal/proxmox-ubuntu-cloudinit-bash/main/script.sh`

Edit variables to match you needs

`bash script.sh`

---

My needs are pretty simple so i prefer this over template, I use Ansible to do everything else after VM is ready.

---

**Useful resources:**
- https://pve.proxmox.com/wiki/Cloud-Init_Support
- https://pve.proxmox.com/pve-docs/qm.1.html
- https://cloud-images.ubuntu.com/
- https://ubuntu.com/server/docs/cloud-images/introduction