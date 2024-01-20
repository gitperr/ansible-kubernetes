# ansible-kubernetes (WIP)
Ansible for deploying Kubernetes on Raspberry Pis. Currently heavily WIP.

## Steps
1- Flash debian12 to an SD card, and attach it to your Pi  
2- Login to your debian manually, and add an ssh key to your user, so you can use ansible on it later  
3- Install python on the pi `apt install python3` 
> You can get rid of steps 1-3 if you have already flashed a debian with a specific ssh key and python installed 
4- Create ~/.ssh/config file and add your pis there with their IPs, and alias them if you wish to  
5- Add your pi to the `inventories/hosts.ini` file  
6- You should be ready to run the ansibles now  
