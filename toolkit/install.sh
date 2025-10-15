sudo apt update -y
sudo apt install docker.io -y
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
exit

ssh ubuntu@<IP_EC2>
