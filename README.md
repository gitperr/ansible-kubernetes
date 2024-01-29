# ansible-kubernetes (WIP)
Ansible for deploying Kubernetes on Raspberry Pis. Currently heavily WIP.

## Steps
1- Flash debian12 to an SD card, and attach it to your Pi  
2- Login to your debian manually, and add an ssh key to your user, so you can use ansible on it later  
3- Install python, and sudo on the pi `apt install python3 sudo -y` 
> You can get rid of steps 1-3 if you have already flashed a debian with a specific ssh key, sudo and python installed

4- Clone this repo on your ansible controller.  
5- On your ansible controller, create `~/.ssh/config` file and add your pis there with their IPs, and alias them if you wish to    
6- Add your pi to the `inventories/hosts.ini` file  
7- You should be ready to run the ansibles now  

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
## Organization of the repo
Currently, each role is split into two (install/remove) and has two caller plays at the root of repo, one for each.  
To install something, simply call its make target, and to remove it, simply call the removal make target.

## Push images to the cluster's docker registry
> Suboptimal, but serves the purpose for now.  
```sudo docker tag <image> rpi-control:31000/<image> && sudo docker push rpi-control:31000/<image>```

## Project ideas
- [ ] Prometheus & Ruuvi weather station
- [ ] Minecraft/Valheim

### Prometheus notes
- Can start the kube-prometheus properly, but it still needs to be exposed with ingress --> dropped for now
- Certs might not be in order yet --> dropped for now
- Prometheus operator works nicely, better work with this before moving onto kube-prometheus