# Server Infrastructure
![Docker|98](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

## 🌐 Language / Язык
Select your preferred language for documentation:

* 🇺🇸 **[English Documentation](docs/README_EN.md)**
* 🇷🇺 **[Русская документация](docs/README_RU.md)**

## 🚀 Quick Start (Short)
### Clone the repository and enter the project directory
```bash
git clone https://github.com/Danbesy/infrastructure.git
```
### Initialize the server and deploy configurations via Ansible
```bash
ansible-playbook -i environments/development/inventory.ini playbook.yaml -k -K
```
### Set permissions and run the script to start or restart all services
```bash
chmod +x start.sh && ./start.sh
```