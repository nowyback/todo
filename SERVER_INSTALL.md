# Todoodle Server Installation

This package contains everything you need to deploy Todoodle as a server application.

## 🚀 Quick Installation

### Prerequisites
- Node.js 16+ installed
- npm package manager
- Terminal or command prompt
- (Optional) Git for version control

### Installation Steps

1. **Extract the package** to your desired location
2. **Navigate to the directory**:
   ```bash
   cd todoodle-server
   ```
3. **Install dependencies**:
   ```bash
   npm install
   ```
4. **Start the server**:
   ```bash
   npm run server
   ```
5. **Access the application**:
   - Open your browser and go to `http://localhost:3001`
   - Or access from other devices: `http://YOUR_IP:3001`

## 📁 Package Contents

```
todoodle-server/
├── package.json              # Dependencies and scripts
├── package-lock.json          # Locked dependencies
├── src/
│   ├── api-server.js         # Main server application
│   ├── api-config.json       # Server configuration (created after first run)
│   └── todos-api.json        # Data storage (created after first run)
├── docs/
│   ├── SERVER_SETUP.md       # Detailed setup guide
│   ├── CONSOLE.md             # Console version guide
│   └── README.md              # Documentation
├── console.js                # Console version (local)
├── console-server.js         # Console version (server sync)
├── README.md                 # This file
└── install.sh               # Installation script (Linux/Mac)
```

## 🔧 Configuration

### Default Configuration
- **Host**: `localhost`
- **Port**: `3001`
- **Data Storage**: Local JSON files
- **CORS**: Enabled for all origins

### Custom Configuration

#### Method 1: Environment Variables
```bash
# Set custom host and port
HOST=todoodle.example PORT=8080 npm run server

# Use IP address
HOST=192.168.1.100 PORT=3001 npm run server
```

#### Method 2: Configuration File
Create `src/api-config.json`:
```json
{
  "address": "todoodle.example",
  "port": 3001
}
```

#### Method 3: Command Line Arguments
```bash
# Start with custom settings
node src/api-server.js --host=todoodle.example --port=8080
```

## 🌐 Network Access

### Local Network Access
To access from other devices on your network:
```bash
# Bind to all interfaces
HOST=0.0.0.0 PORT=3001 npm run server

# Then access from other devices
http://YOUR_IP:3001
```

### Production Deployment
For production deployment:
```bash
# Use domain name
HOST=todoodle.example PORT=3001 npm run server

# Set up DNS to point todoodle.example to your server IP
# Configure firewall to allow port 3001
# Consider using HTTPS/SSL for production
```

## 📋 Available Scripts

```bash
npm run server           # Start API server
npm run console          # Start console version (local)
npm run console-server   # Start console version (server sync)
npm run dev              # Development mode with auto-restart
```

## 🔍 API Endpoints

### Core Endpoints
- `GET /api/health` - Server health check
- `GET /api/todos` - List all todos
- `POST /api/todos` - Create new todo
- `PUT /api/todos/:id` - Update todo
- `DELETE /api/todos/:id` - Delete todo

### Configuration
- `PUT /api/config/server` - Update server configuration
- `GET /api/docs` - Interactive API documentation

### Data Management
- `GET /api/todos/categories` - List all categories
- `GET /api/stats` - Get completion statistics

## 🛠️ Advanced Setup

### PM2 Process Manager
```bash
# Install PM2
npm install -g pm2

# Start server with PM2
pm2 start src/api-server.js --name "todoodle-api"

# Monitor
pm2 monit

# Restart
pm2 restart todoodle-api

# Stop
pm2 stop todoodle-api
```

### Docker Deployment
```dockerfile
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD ["npm", "run", "server"]
```

Build and run:
```bash
docker build -t todoodle-server .
docker run -p 3001:3001 todoodle-server
```

### Nginx Reverse Proxy
```nginx
server {
    listen 80;
    server_name todoodle.example;

    location / {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### Systemd Service (Linux)
Create `/etc/systemd/system/todoodle.service`:
```ini
[Unit]
Description=Todoodle API Server
After=network.target

[Service]
Type=simple
User=your-username
WorkingDirectory=/path/to/todoodle-server
ExecStart=/usr/bin/npm run server
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

Enable and start:
```bash
sudo systemctl enable todoodle
sudo systemctl start todoodle
sudo systemctl status todoodle
```

## 🔒 Security Considerations

### Production Security
- **HTTPS/SSL**: Set up SSL certificates for production
- **Firewall**: Configure firewall to allow only necessary ports
- **Authentication**: Consider adding user authentication
- **Rate Limiting**: Implement rate limiting to prevent abuse
- **Input Validation**: All inputs are validated in the server

### Environment Variables
```bash
NODE_ENV=production          # Production mode
PORT=3001                   # Server port
HOST=todoodle.example        # Server host
DATA_PATH=./data             # Data directory
LOG_LEVEL=info               # Logging level
```

## 📱 Client Applications

### Desktop App
The desktop Electron app can connect to this server:
1. **Download** the desktop app
2. **Configure** server address: `todoodle.example:3001`
3. **Connect** and start using the application

### Console Version
Use the server-enabled console version:
```bash
npm run console-server
```

### Web Interface
Access the web interface directly in your browser:
```
http://todoodle.example:3001
```

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
Error: listen EADDRINUSE :::3001
```
**Solution**: Change port in configuration or kill the process:
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
Error: EACCES: permission denied
```
**Solution**: Check file permissions or run with appropriate user:
```bash
# Fix permissions (Linux/Mac)
chmod +x src/api-server.js

# Run as different user
sudo npm run server
```

#### Module Not Found
```bash
Error: Cannot find module 'express'
```
**Solution**: Install dependencies:
```bash
npm install
```

#### Connection Refused
```bash
Error: connect ECONNREFUSED 127.0.0.1:3001
```
**Solution**: Ensure server is running and correct port:
```bash
# Check if server is running
curl http://localhost:3001/api/health

# Start server
npm run server
```

### Debug Mode
Enable detailed logging:
```bash
# Set debug environment variable
DEBUG=todoodle:* npm run server

# Or enable logging
NODE_ENV=development npm run server
```

### Health Check
Test server health:
```bash
curl http://localhost:3001/api/health

# With custom address
curl http://todoodle.example:3001/api/health
```

## 📊 Data Management

### Data Storage
- **Location**: `src/todos-api.json`
- **Format**: JSON
- **Backup**: Regularly backup this file
- **Migration**: Can be migrated to database later

### Data Backup
```bash
# Create backup
cp src/todos-api.json backups/todos-api-$(date +%Y%m%d).json

# Restore from backup
cp backups/todos-api-20231231.json src/todos-api.json
```

### Data Export
```bash
# Export to CSV
node -e "const fs = require('fs'); const data = JSON.parse(fs.readFileSync('src/todos-api.json', 'utf8')); console.log('text,completed,category'); data.forEach(t => console.log(`"${t.text}",${t.completed},${t.category}`));" > todos.csv
```

## 📚 Documentation

### Additional Guides
- [Server Setup Guide](docs/SERVER_SETUP.md) - Detailed configuration
- [Console Guide](docs/CONSOLE.md) - Command-line interface
- [API Documentation](http://localhost:3001/api-docs) - Interactive API docs

### API Documentation
- **Interactive Docs**: Available at `/api-docs`
- **Health Check**: `GET /api/health`
- **OpenAPI Spec**: Available at `/api-docs/json`

## 🚀 Performance Optimization

### Node.js Optimization
```bash
# Increase memory limit
node --max-old-space-size=4096 src/api-server.js

# Use cluster mode for multi-core
npm install -g cluster
cluster src/api-server.js
```

### Database Migration
For production use, consider migrating to a proper database:
```bash
# MongoDB example
npm install mongoose

# PostgreSQL example
npm install pg
```

## 🤝 Support

### Getting Help
- **Documentation**: [docs/SERVER_SETUP.md](docs/SERVER_SETUP.md)
- **Issues**: [GitHub Issues](https://github.com/nowyback/todoodle/issues)
- **Community**: [Discussions](https://github.com/nowyback/todoodle/discussions)

### Reporting Issues
When reporting issues, please include:
- **Node.js version**: `node --version`
- **Operating System**: `uname -a` (Linux/Mac) or `ver` (Windows)
- **Error messages**: Full error output
- **Configuration**: Your server configuration
- **Steps to reproduce**: Detailed reproduction steps

---

**Happy server deployment!** 🚀✨

For more information, visit [https://github.com/nowyback/todoodle](https://github.com/nowyback/todoodle)
