## 📂 Project structure (EN)
> **Personal modular server infrastructure managed with Docker.**
```text
.
├── mail/                # Mail infrastructure (Stalwart)
├── matrix/              # Matrix federation (Dendrite & PostgreSQL)
├── monitoring/          # Observability stack (Grafana, Prometheus, Node-Exporter)
├── mtproto-proxy/       # Telegram MTProto Proxy service
├── reverse-proxy/       # Nginx Reverse-Proxy gateway (Docker & Host services)
│   ├── snippets/        # Modular Nginx configs (SSL, Cloudflare, Matrix)
│   ├── certs/           # SSL Certificates storage
│   └── website/         # Website deployment (React, Next.js, Tailwind CSS)
├── infrastructure.yaml  # Network orchestration file
└── start.sh             # Global deployment automation script
```
*Note: Use `./start.sh` to provision the network stack and deploy all services sequentially.*

## 🛠 Tech Stack
* Orchestration: Docker & Docker Compose
* Gateway: Nginx
* Services:
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
2.  **Configure env/yml and SSL Certificates.**
3.  **Deploy all services:**
    ```bash
    chmod +x start.sh && ./start.sh
    ```

## 🔒 Security
  - **Read-Only Mounts:** All Nginx snippets are mounted as :ro to prevent unauthorized modifications.
  - **IP Masking:** Integrated cloudflare.conf to restore real visitor IPs.
  - **Secrets Management:** Sensitive data is strictly decoupled from the code via .env files.

## 🛠 Maintenance
  - **View Logs:** `docker compose logs -f`
  - **Start Service:** `docker compose up -d`
  - **Down Service:** `docker compose down`