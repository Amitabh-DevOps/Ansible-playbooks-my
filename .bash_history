clear
sudo apt update
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
clear
ansible --version
clear
ls
clear
mkdir keys && pwd
ls
cd keys
ls
clear
pwd
ls
clear
pwd
ls
sudo vim /etc/ansible/hosts
ansible-inventory --list -y
ansible-inventory --list
ansible servers -m ping
ls
ls -l
chmod 400 ansible-practice.pem 
ls -l
clear
cd
sudo vim /etc/ansible/hosts
ansible-inventory --list
ansible servers -m ping
clear
ansible servers -m ping -y
ansible servers -m ping
yes
clear
ansible servers -m ping
sudo vim /etc/ansible/hosts
ansible servers -m ping
ansible server2 -m ping
clear
ansible servers -m ping
ansible server2 -m ping
sudo vim /etc/ansible/hosts
ssh -i /home/ubuntu/keys/ansible-practice.pem ec2_user@54.74.194.174
ssh -i /home/ubuntu/keys/ansible-practice.pem ec2_user@54.74.194.174 -v
ssh -i /home/ubuntu/keys/ansible-practice.pem ubuntu@54.74.194.174
ssh -i /home/ubuntu/keys/ansible-practice.pem ec2-user@54.74.194.174
clear
sudo vim /etc/ansible/hosts
ansible inventory --list
ansible-inventory --list
cler
clear
ansible-inventory --list
clear
ansible servers -m ping
ansible servers -a "date"
ansible servers all -a "date"
ansible all -m ping
clear
ansible servers -a "sudo apt update && sudo apt upgrade -y"
ansible server1 -a "sudo apt update && sudo apt upgrade -y"
clear
ansible servers -a "sudo apt update"
clear
ansible server1 -a "sudo apt update"
ansible server1 -a "sudo apt upgrade -y"
clear
ansible server2 -a "sudo dnf update"
ansible server2 -a "sudo dnf upgrade -y"
clear
ansible server1 -a "sudo apt update && sudo apt upgrade -y"
clear
ansible server2 -a "sudo yum update -y" 
clear
ls
vim show_date.yml
ansible-playbook -v show_date.yml 
clear
vim system_services_playbook.yml
ansible-playbook -v system_services_playbook.yml 
clear
ls
clear
vim install_docker_playbook.yml
clear
vim install_nginx_playbook.yml
ansible-playbook -v install_nginx_playbook.yml 
clear
vim install_nginx_playbook.yml
vim index.html
vim install_nginx_playbook.yml
ansible-playbook -v install_nginx_playbook.yml 
vim install_nginx_playbook.yml
clear
ansible-playbook -v install_nginx_playbook.yml 
clear
ansible-playbook install_nginx_playbook.yml 
clear
vim index.html
ls
rm index.html 
ls
clearm
clear
vim index.html
ansible-playbook install_nginx_playbook.yml 
clear
rm index.html 
vim index.html
ansible-playbook install_nginx_playbook.yml 
clear
rm index.html 
ls
clear
vim index.html
ansible-playbook install_nginx_playbook.yml 
clear
vim index.html
ansible-playbook install_nginx_playbook.yml 
vim index.html
clear
ls
clear
vim install_docker_playbook.yml 
ansible-playbook -v install_docker_playbook.yml 
ansible servers -a "docker --version"
clear
ansible-playbook install_docker_playbook.yml 
ansible servers -a "docker --version"
clear
vim system_patching_playbook.yml
ansible-playbook system_patching_playbook.yml 
vim system_patching_playbook.yml
clear
ansible-playbook system_patching_playbook.yml 
vim system_patching_playbook.yml
clear
ansible-playbook system_patching_playbook.yml 
ansible-playbook -v system_patching_playbook.yml 
vim system_patching_playbook.yml
ansible servers -m setup | grep -i "distribution"
clear
ansible servers -m setup | grep -i "distribution"
clear
vim system_patching_playbook.yml
ansible-playbook system_patching_playbook.yml 
clear
ansible-playbook -v system_patching_playbook.yml 
clear
vim system_patching_playbook.yml
ansible-playbook system_patching_playbook.yml 
clear
exit
clear
ls
cat index.html
clear
ls
cat show_date.yml
clear
ls
cat install_docker_playbook.yml 
clear
ls
cat system_patching_playbook.yml
clear
ls
cat install_nginx_playbook.yml
cat system_services_playbook.yml
clear
ls
exit
ls
clear
ls
ansible-playboo show_date.yml 
clear
ansible-playbook show_date.yml 
sudo vim /etc/ansible/hosts
clear
ansible-playbook show_date.yml 
ansible-playbook -v show_date.yml 
clear
ansible-playbook system_services_playbook.yml 
clear
sudo vim /etc/ansible/hosts
exit
ls
cler
clear
ls
vim show_date.yml 
cler
clera
clear
ansible-playbook show_date.yml 
sudo vim /etc/ansible/hosts
ansible-playbook show_date.yml 
vim show_date.yml 
ansible-playbook show_date.yml 
clear
ansible-playbook -v show_date.yml 
clear
ls
vim system_services_playbook.yml 
cler
clear
ansible-playbook -v system_services_playbook.yml 
ls
clear
exit
