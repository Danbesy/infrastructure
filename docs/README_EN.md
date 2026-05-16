## 📂 Project structure (EN)
> **Personal modular server infrastructure managed with Docker.**
```text
.
├── ansible               # Global deployment automation
├── caddy                 # Cloud storage service (Caddy)
├── docs                  # Documentation (EN/RU)
├── mail                  # Mail infrastructure (Stalwart)
├── matrix                # Matrix federation (Dendrite & PostgreSQL)
├── monitoring            # Observability stack (Grafana, Prometheus, Node-Exporter)
├── mtproto-proxy         # Telegram MTProto Proxy service
├── reverse-proxy         # Nginx Reverse-Proxy gateway (Docker & Host services)
│   ├── conf.d            # Main Nginx configs (Grafana, Website, etc.)
│   ├── snippets          # Modular Nginx configs (SSL, Cloudflare, Matrix)
│   ├── certs             # SSL Certificates storage
│   └── website           # Website deployment (React, Next.js, Tailwind CSS)
├── infrastructure.yaml   # Network orchestration file
└── scripts               # Utility scripts
    └── start.sh          # Infrastructure startup/reload script

```
*💡 Note: Ansible handles full server provisioning and configuration delivery, while ./scripts/start.sh is used exclusively for network preparation, initial startup, and service reloads without modifying configurations.*

## 🛠 Tech Stack
  - Orchestration: Docker & Docker Compose
  - Ingress Gateway: Nginx
  - Deployment Automation: Ansible
  - Services:
    * Cloud Storage: Caddy
    * Mail: Stalwart
    * Matrix: Dendrite, PostgreSQL
    * Monitoring: Grafana, Prometheus, Node-Exporter
    * Telegram MTProto Proxy
    * Nginx: Reverse-Proxy
    * Website: React 19, Next.js 15, Tailwind CSS

## 🚀 Quick Start
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Danbesy/infrastructure.git
    cd infrastructure
    ```
2.  **Deploy configuration:**
    Prepare the inventory and environment variables in group_vars/all, then run Ansible to initialize the server and generate all required configurations:
    ```bash
    cd ansible && ansible-playbook -i environments/development/inventory.ini playbook.yaml
    ```
    *(For the first deployment on a fresh server, add the -k -K flags for password-based authentication.)*
3.  **Start or reload infrastructure:**
    Use the orchestration script to automatically prepare Docker networks and sequentially start all services:
    ```bash
    chmod +x scripts/start.sh && ./scripts/start.sh
    ```

## 🔒 Security
  - **Read-Only Mounts:** All Nginx snippets are mounted as :ro to prevent unauthorized modifications.
  - **IP Masking:** Integrated cloudflare.conf to restore real visitor IPs.
  - **Secrets Management:** Sensitive data is isolated from the codebase using .env files and Ansible Vault.

## 🛠 Maintenance
  - **View Logs:** `docker compose logs -f`
  - **Start Service:** `docker compose up -d`
  - **Down Service:** `docker compose down`