# ansible-kubernetes (WIP)
Ansible for deploying Kubernetes on Raspberry Pis. Currently heavily WIP.

## Steps
1- Flash debian12 to an SD card, and attach it to your Pi  
2- Login to your debian manually, and add an ssh key to your user, so you can use ansible on it later  
3- Install python, and sudo on the pi `apt install python3 sudo -y` 
> You can get rid of steps 1-3 if you have already flashed a debian with a specific ssh key, sudo and python installed

4- Clone this repo. On your ansible controller, create ~/.ssh/config file and add your pis there with their IPs, and alias them if you wish to  
5- Add your pi to the `inventories/hosts.ini` file  
6- You should be ready to run the ansibles now  

## Start the cluster
- Not entirely idempotent yet, but if you run with clean pis that haven't run k3s before, it should work.  
```shell
make k3s
```

- You can ssh into the control node and check once it finishes:  
```shell
ssh rpi-control "kubectl get nodes"
```  
output should look like that:  
```
NAME           STATUS   ROLES                  AGE     VERSION
rpi-worker-2   Ready    <none>                 6m52s   v1.28.5+k3s1
rpi-control    Ready    control-plane,master   7m8s    v1.28.5+k3s1
rpi-worker-1   Ready    <none>                 6m37s   v1.28.5+k3s1
```