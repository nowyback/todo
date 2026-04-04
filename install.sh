#!/bin/bash

# Todoodle Server Installation Script
# This script installs and configures Todoodle server

set -e

echo "🚀 Todoodle Server Installation"
echo "================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Node.js is installed
check_nodejs() {
    if command -v node >/dev/null 2>&1; then
        NODE_VERSION=$(node --version)
        print_status "Node.js found: $NODE_VERSION"
    else
        print_error "Node.js is not installed"
        echo "Please install Node.js 16+ from https://nodejs.org/"
        exit 1
    fi
}

# Check if npm is installed
check_npm() {
    if command -v npm >/dev/null 2>&1; then
        NPM_VERSION=$(npm --version)
        print_status "npm found: $NPM_VERSION"
    else
        print_error "npm is not installed"
        echo "Please install npm (comes with Node.js)"
        exit 1
    fi
}

# Install dependencies
install_dependencies() {
    print_status "Installing dependencies..."
    npm install
    print_status "Dependencies installed successfully"
}

# Create necessary directories
create_directories() {
    print_status "Creating necessary directories..."
    
    # Create data directory if it doesn't exist
    if [ ! -d "data" ]; then
        mkdir -p data
        print_status "Created data directory"
    fi
    
    # Create logs directory if it doesn't exist
    if [ ! -d "logs" ]; then
        mkdir -p logs
        print_status "Created logs directory"
    fi
    
    # Create backups directory if it doesn't exist
    if [ ! -d "backups" ]; then
        mkdir -p backups
        print_status "Created backups directory"
    fi
}

# Create default configuration
create_config() {
    if [ ! -f "src/api-config.json" ]; then
        print_status "Creating default configuration..."
        cat > src/api-config.json << EOF
{
  "address": "localhost",
  "port": 3001
}
EOF
        print_status "Default configuration created"
    else
        print_warning "Configuration file already exists"
    fi
}

# Create systemd service file (Linux only)
create_systemd_service() {
    if [[ "$OSTYPE" == "linux"* ]] && command -v systemctl >/dev/null 2>&1; then
        if [ ! -f "/etc/systemd/system/todoodle.service" ]; then
            print_status "Creating systemd service file..."
            
            # Get current user and directory
            USER=$(whoami)
            DIR=$(pwd)
            
            sudo tee /etc/systemd/system/todoodle.service > /dev/null << EOF
[Unit]
Description=Todoodle API Server
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$DIR
ExecStart=/usr/bin/npm run server
Restart=always
RestartSec=10
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOF
            
            print_status "Systemd service created"
            print_warning "To enable the service, run: sudo systemctl enable todoodle"
            print_warning "To start the service, run: sudo systemctl start todoodle"
        else
            print_warning "Systemd service already exists"
        fi
    fi
}

# Create startup script
create_startup_script() {
    print_status "Creating startup script..."
    
    cat > start-server.sh << 'EOF'
#!/bin/bash
# Todoodle Server Startup Script

# Get the directory where this script is located
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to the directory
cd "$DIR"

# Start the server
echo "Starting Todoodle Server..."
npm run server
EOF

    chmod +x start-server.sh
    print_status "Startup script created: start-server.sh"
}

# Test server installation
test_installation() {
    print_status "Testing server installation..."
    
    # Start server in background
    npm run server &
    SERVER_PID=$!
    
    # Wait for server to start
    sleep 3
    
    # Test health endpoint
    if curl -s http://localhost:3001/api/health > /dev/null; then
        print_status "Server is running correctly!"
        print_status "Health check passed"
        
        # Stop the test server
        kill $SERVER_PID 2>/dev/null
        print_status "Test server stopped"
    else
        print_error "Server health check failed"
        print_error "Please check the installation"
        exit 1
    fi
}

# Display next steps
show_next_steps() {
    echo ""
    echo "🎉 Installation completed successfully!"
    echo ""
    echo "📋 Next Steps:"
    echo "1. Start the server:"
    echo "   npm run server"
    echo ""
    echo "2. Or use the startup script:"
    echo "   ./start-server.sh"
    echo ""
    echo "3. Access the application:"
    echo "   http://localhost:3001"
    echo ""
    echo "4. For production deployment:"
    echo "   - Set environment variables (HOST, PORT)"
    echo "   - Use process manager (PM2, systemd)"
    echo "   - Set up reverse proxy (Nginx)"
    echo ""
    echo "5. Configuration:"
    echo "   - Edit src/api-config.json for custom settings"
    echo "   - Use environment variables for production"
    echo "   - See docs/SERVER_SETUP.md for detailed guide"
    echo ""
    echo "📚 Documentation:"
    echo "   - Server Setup: docs/SERVER_SETUP.md"
    echo "   - Console Guide: docs/CONSOLE.md"
    echo "   - API Docs: http://localhost:3001/api-docs"
    echo ""
    echo "🚀 Happy server deployment!"
}

# Main installation function
main() {
    echo "Checking system requirements..."
    check_nodejs
    check_npm
    
    echo ""
    echo "Installing Todoodle server..."
    install_dependencies
    create_directories
    create_config
    create_systemd_service
    create_startup_script
    
    echo ""
    echo "Testing installation..."
    test_installation
    
    show_next_steps
}

# Run main function
main "$@"
