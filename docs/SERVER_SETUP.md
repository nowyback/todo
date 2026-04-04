# Todoodle Server Setup

This guide explains how to set up Todoodle with a backend server for advanced functionality, including the new address:port configuration system.

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ installed
- npm package manager
- Terminal or command prompt
- Git (for cloning)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/nowyback/todoodle.git
   cd todoodle
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the server**
   ```bash
   npm run server
   ```

4. **Start the application**
   ```bash
   npm start
   ```

The server will run on `http://localhost:3001` by default.

## 📋 Available Scripts

### Development
- `npm start` - Start the Electron app
- `npm run server` - Start the API server
- `npm run console` - Start console version (local)
- `npm run console-server` - Start console version (server sync)
- `npm run dev` - Start both server and app (if configured)

### Building
- `npm run dist-win` - Build Windows installer
- `npm run dist-mac` - Build macOS installer
- `npm run dist-linux` - Build Linux AppImage

### Mobile
- `npm run mobile:android` - Build Android app
- `npm run mobile:ios` - Build iOS app

## 🔧 Server Configuration

### Default Settings
- **Host**: `localhost`
- **Port**: `3001`
- **Data Storage**: Local JSON files
- **CORS**: Enabled for all origins

### Address:Port Configuration

#### 🌐 New Configuration System
The server now supports full address:port configuration, allowing you to:
- **Use custom domains** - `todoodle.example:3001`
- **Use IP addresses** - `192.168.1.100:3001`
- **Use localhost** - `localhost:3001`

#### 📱 Configuration Methods

##### Method 1: Desktop App (Recommended)
1. **Start the app** - `npm start`
2. **Open settings** - Press `Ctrl+P`
3. **Enter server address** - Format: `address:port`
4. **Click "Update Server"**
5. **Restart server** - Changes apply after restart

##### Method 2: Environment Variables
```bash
# Set custom host and port
HOST=todoodle.example PORT=3001 npm run server

# Or use IP address
HOST=192.168.1.100 PORT=8080 npm run server
```

##### Method 3: Configuration File
Create `src/api-config.json`:
```json
{
  "address": "todoodle.example",
  "port": 3001
}
```

#### 🎯 Supported Formats
```bash
# Domain names
todoodle.example:3001
api.todoodle.com:8080
my-server.local:3001

# IP addresses  
127.0.0.1:3001
192.168.1.100:3001
10.0.0.5:8080

# Localhost
localhost:3001
localhost:8080
```

### Port Configuration
You can change the server port through the app:
1. Open Todoodle
2. Press `Ctrl+P` to open port configuration
3. Enter new server address in format: `address:port`
4. Click update
5. Restart the API server

### Available Endpoints

#### Health Check
```http
GET /api/health
```

#### Server Configuration
```http
PUT /api/config/server
Content-Type: application/json

{
  "address": "todoodle.example",
  "port": 3002
}
```

#### Data Management
```http
GET /api/todos          # Get all todos
POST /api/todos         # Create todo
PUT /api/todos/:id     # Update todo
DELETE /api/todos/:id   # Delete todo
```

#### Categories
```http
GET /api/todos/categories  # Get all categories
```

#### Statistics
```http
GET /api/stats             # Get completion statistics
```

## 📁 Project Structure

```
todoodle/
├── src/
│   ├── main.js          # Electron main process
│   ├── script.js        # Frontend logic
│   ├── styles.css       # App styling
│   ├── index.html       # Main HTML
│   ├── api-server.js    # Backend server
│   ├── themes/          # Custom themes
│   └── api-config.json  # Server configuration
├── docs/               # Documentation
├── mobile/             # Mobile app
├── console.js          # Console version (local)
├── console-server.js   # Console version (server)
└── dist/               # Build output
```

## 🌐 Network Access

### Local Network
To access Todoodle from other devices on your network:
1. **Start server** with custom host:
   ```bash
   HOST=0.0.0.0 PORT=3001 npm run server
   ```
2. **Find your local IP**:
   ```bash
   # Windows
   ipconfig
   
   # Mac/Linux
   ifconfig
   ```
3. **Access via browser**:
   ```
   http://YOUR_IP:3001
   ```

### Remote Server
For production deployment:
1. **Configure domain**:
   ```bash
   HOST=todoodle.example PORT=3001 npm run server
   ```
2. **Set up DNS** - Point `todoodle.example` to your server IP
3. **Configure firewall** - Allow port 3001
4. **Use HTTPS** - Set up SSL certificate

### Firewall Settings
Make sure the server port is allowed through:
- **Windows Firewall** - Allow inbound connections
- **Network router** - Port forwarding if needed
- **Antivirus software** - Add exception for Node.js

## 🔒 Security Considerations

### Development Mode
- **Localhost only** - Server runs on localhost by default
- **No authentication** - Open access for development
- **CORS enabled** - All origins allowed
- **Local storage** - Data stored in JSON files

### Production Deployment
For production use, consider:
- **HTTPS/SSL certificates** - Encrypt traffic
- **User authentication** - Add login system
- **Database integration** - Replace JSON with proper database
- **Rate limiting** - Prevent abuse
- **Input validation** - Sanitize all inputs
- **Environment variables** - Secure configuration

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
Error: listen EADDRINUSE :::3001
```
**Solutions**:
- **Change port** - Use different port in configuration
- **Kill process** - Find and terminate the process:
  ```bash
  # Find process
  netstat -ano | findstr :3001
  
  # Kill process (Windows)
  taskkill /PID <PID> /F
  
  # Kill process (Mac/Linux)
  kill -9 <PID>
  ```

#### Server Not Detected
**Problem**: App can't find running server
**Solutions**:
- **Check server is running** - Verify server started successfully
- **Check address** - Ensure correct address:port format
- **Check firewall** - Allow connections through firewall
- **Use localhost** - Try `localhost:3001` first

#### Configuration Not Saving
**Problem**: Server configuration changes don't persist
**Solutions**:
- **Check file permissions** - Ensure write access to `api-config.json`
- **Restart server** - Changes apply after restart
- **Verify format** - Use correct `address:port` format

#### Connection Refused
```bash
Error: connect ECONNREFUSED 127.0.0.1:3001
```
**Solutions**:
- **Start server first** - Ensure API server is running
- **Check port** - Verify correct port number
- **Check address** - Use correct server address

### Debug Mode
Enable detailed logging:
```bash
# Set debug environment variable
DEBUG=todoodle:* npm run server

# Or enable logging in code
const DEBUG = process.env.DEBUG === 'true';
```

### Health Check
Test server health:
```bash
# Check if server is responding
curl http://localhost:3001/api/health

# With custom address
curl http://todoodle.example:3001/api/health
```

## 📱 Mobile Development

### Android Setup
1. **Install Android Studio**
2. **Set up Android SDK**
3. **Configure Capacitor**:
   ```bash
   npm run capacitor:add
   npm run capacitor:sync
   npm run capacitor:open
   ```

### iOS Setup
1. **Install Xcode**
2. **Set up iOS simulator**
3. **Build and run**:
   ```bash
   npm run capacitor:sync ios
   npm run capacitor:open
   ```

## 🚀 Deployment

### Docker Setup
```dockerfile
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD ["npm", "run", "server"]
```

### Environment Variables
```bash
PORT=3001
HOST=localhost
NODE_ENV=production
DATA_PATH=./data
```

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

## 📚 Additional Resources

### Documentation
- [Main README](../README.md) - Complete feature overview
- [Console Guide](CONSOLE.md) - Command-line interface
- [Download Guide](download.html) - Installation instructions
- [Theme Guide](../src/themes/README.md) - Custom themes

### API Documentation
- **Interactive Docs** - `http://localhost:3001/api-docs`
- **OpenAPI Spec** - Available at `/api-docs/json`
- **Health Check** - `GET /api/health`

### Development Tools
- [Electron Documentation](https://electronjs.org/docs)
- [Express.js Guide](https://expressjs.com/en/guide/)
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**
3. **Make your changes**
4. **Test thoroughly**
5. **Submit a pull request**

## 📄 License

MIT License - see [LICENSE](../LICENSE) for details
