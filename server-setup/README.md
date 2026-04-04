# Todoodle Server Setup Package

This package contains everything you need to deploy Todoodle as a standalone server application.

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ installed
- npm package manager
- Terminal or command prompt

### Installation

#### Windows
```bash
# Run the installation script
.\install.bat

# Or install manually
npm install
npm run server
```

#### Linux/Mac
```bash
# Make the script executable
chmod +x install.sh

# Run the installation script
./install.sh

# Or install manually
npm install
npm run server
```

### Access the Application
- **Local**: http://localhost:3001
- **Network**: http://YOUR_IP:3001
- **API Docs**: http://localhost:3001/api-docs

## 📁 Package Contents

```
server-setup/
├── package.json              # Dependencies and scripts
├── SERVER_INSTALL.md          # Installation guide
├── install.sh               # Linux/Mac installer
├── install.bat              # Windows installer
├── start-server.bat          # Windows startup script
├── Dockerfile               # Docker configuration
├── docker-compose-server.yml  # Docker Compose config
├── README.md               # This file
├── src/
│   ├── api-server.js         # Main server application
│   ├── main.js              # Electron main process
│   ├── preload.js           # Electron preload script
│   ├── manifest.json         # PWA manifest
│   └── icon.ico             # Application icon
│   └── logo.svg             # Application logo
├── console.js              # Console version (local)
└── console-server.js         # Console version (server)
```

## 🔧 Configuration

### Default Configuration
- **Host**: `localhost`
- **Port**: `3001`
- **Data Storage**: Local JSON files
- **CORS**: Enabled for all origins

### Custom Configuration

#### Environment Variables
```bash
# Custom host and port
HOST=todoodle.example PORT=8080 npm run server

# Use IP address
HOST=192.168.1.100 PORT=3001 npm run server
```

#### Configuration File
Create `src/api-config.json`:
```json
{
  "address": "todoodle.example",
  "port": 3001
}
```

## 📋 Available Scripts

```bash
npm run server           # Start server
npm run console          # Start console (local)
npm run console-server   # Start console (server sync)
npm run dev              # Development mode with auto-restart
```

## 🌐 Network Access

### Local Network
```bash
# Bind to all interfaces
HOST=0.0.0.0 PORT=3001 npm run server
```

### Production Deployment
```bash
# Domain name
HOST=todoodle.example PORT=3001 npm run server

# With Docker
docker build -t todoodle-server .
docker run -p 3001:3001 todoodle-server
```

## 🐛 Advanced Setup

### Docker Deployment
```bash
# Build image
docker build -t todoodle-server .

# Run container
docker run -p 3001:3001 todoodle-server

# With Docker Compose
docker-compose -f docker-compose-server.yml up -d
```

### Process Manager (PM2)
```bash
# Install PM2
npm install -g pm2

# Start server with PM2
pm2 start src/api-server.js --name "todoodle-api"

# Monitor
pm2 monit

# Restart
pm2 restart todoodle-api
```

### Systemd Service (Linux)
```bash
sudo systemctl enable todoodle
sudo systemctl start todoodle
sudo systemctl status todoodle
```

## 🔍 API Endpoints

### Core Endpoints
- `GET /api/health` - Server health check
- `GET /api/todos` - List all todos
- `POST /api/todos` - Create todo
- `PUT /api/todos/:id` - Update todo
- `DELETE /api/todos/:id` - Delete todo

### Configuration
- `PUT /api/config/server` - Update server configuration
- `GET /api/docs` - Interactive API documentation

### Data Management
- `GET /api/todos/categories` - List categories
- `GET /api/stats` - Get statistics

## 📱 Client Applications

### Desktop App
The desktop app can connect to this server by configuring the server address in the settings.

### Console Version
Use the server-enabled console version for full CLI functionality:
```bash
npm run console-server
```

### Web Interface
Access the web interface directly in your browser at `http://localhost:3001`.

## 🔒 Security

### Production Security
- **HTTPS/SSL**: Set up SSL certificates
- **Firewall**: Configure firewall rules
- **Authentication**: Consider adding user authentication
- **Rate limiting**: Implement rate limiting
- **Input validation**: All inputs are validated

### Environment Variables
```bash
NODE_ENV=production
PORT=3001
HOST=todoodle.example
DATA_PATH=./data
LOG_LEVEL=info
```

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Find process
netstat -ano | findstr :3001

# Kill process (Windows)
taskkill /PID <PID> /F

# Kill process (Linux/Mac)
kill -9 <PID>
```

#### Permission Denied
```bash
# Fix permissions (Linux/Mac)
chmod +x src/api-server.js

# Run as different user
sudo npm run server
```

#### Module Not Found
```bash
npm install
```

#### Connection Refused
```bash
curl http://localhost:3001/api/health
npm run server
```

## 📚 Documentation

- **Server Setup Guide**: `SERVER_INSTALL.md`
- **Console Guide**: `docs/CONSOLE.md`
- **API Documentation**: `http://localhost:3001/api-docs`

## 🚀 Performance

### Node.js Optimization
```bash
# Increase memory limit
node --max-old-space-size=4096 src/api-server.js

# Use cluster mode
npm install -g cluster
cluster src/api-server.js
```

### Database Migration
For production use, consider migrating to a proper database:
```bash
# MongoDB
npm install mongoose

# PostgreSQL
npm install pg
```

## 🤝 Support

- **Issues**: [GitHub Issues](https://github.com/nowyback/todoodle/issues)
- **Discussions**: [GitHub Discussions](https://github.com/nowyback/todoodle/discussions)
- **Documentation**: [docs/](docs/)

---

**Happy server deployment!** 🚀✨
