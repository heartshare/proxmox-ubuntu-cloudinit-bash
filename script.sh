### Edit values below ###
#VM ID
id=999
#VM Name
name=ubuntu2004
#Memory im megabytes
ram=2048
#CPU cores
cpu=1
#Default disk is 2G, variable below = 2G + selected value
disk=18
#Usermame and password
user=Ubuntu
password=Ubuntu123
#Qemu agent (1,0)
qemu_agent=1
#Disk format(qcow2, raw, vmdk)
dformat=qcow2
### Edit values above ###

echo "Downloading Ubuntu 20.04 Cloud image."
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
echo "Creating VM."
qm create $id --name $name --memory $ram --cores $cpu --net0 virtio,bridge=vmbr0
qm importdisk $id focal-server-cloudimg-amd64.img local-lvm --format $dformat
echo "Setting parameters"
qm set $id --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-$id-disk-0
qm set $id --ide2 local-lvm:cloudinit
qm set $id --boot c --bootdisk scsi0
qm set $id --serial0 socket --vga serial0
qm resize $id scsi0 +${disk}G
qm set $id --ipconfig0 ip=dhcp
qm set $id --sshkey ~/.ssh/id_rsa.pub
qm set $id --cipassword $password
qm set $id --agent $qemu_agent
echo "Cleaning up."
rm focal-server-cloudimg-amd64.img
echo "Starting VM $name."
qm start $id
echo "Complete."