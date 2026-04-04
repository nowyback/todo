# Todoodle - A Minimalist Task Manager for Developers

A sleek, feature-rich todo application with multiple interfaces, designed specifically for developers who want both a beautiful desktop app, powerful console interface, and flexible REST API.

## 🎨 Multiple Interfaces

### 🖥️ Desktop App (Electron)
- **Custom Themes** - Drop-in `.theme.css` files for complete customization
- **Background Images** - Set custom backgrounds that override theme backgrounds
- **Glass Morphism UI** - Modern frosted glass effects with smooth animations
- **Individual task progress** with color-coded sliders (0-100%)
- **Custom categories** with filtering and sorting
- **Notes functionality** for detailed task descriptions
- **Dark/Light theme** toggle with smooth transitions
- **Keyboard shortcuts** for power users
- **Local storage** persistence

### 💻 Console Version
- **Full CLI interface** - Complete command-line todo management
- **Local JSON storage** - Portable data files
- **Server integration** - Sync with API server when available
- **Progress tracking** - 0-100% progress with notes
- **Category management** - Organize tasks by category
- **Search functionality** - Find todos quickly
- **Statistics** - Detailed completion metrics

### 🌐 REST API Server
- **Full OpenAPI documentation** at `/api-docs`
- **Configurable address and port** - Support for domains and IPs
- **CRUD operations** for todos with full metadata
- **Category management** endpoints
- **Statistics endpoint** for analytics
- **CORS enabled** for external integrations
- **Health checks** for monitoring

## 🎨 Theme System

### ✨ Custom Themes
- **Auto-detection** - Drop `.theme.css` files in `src/themes/` folder
- **Dynamic loading** - Themes appear instantly in settings (Ctrl+B)
- **Template included** - `TEMPLATE.theme.template` for easy creation
- **4 built-in themes**:
  - **Dark Matter** - Blue frosty space theme
  - **Fallout Terminal** - Green terminal aesthetic
  - **Translucent** - Modern glass morphism
  - **Example Custom** - Starting template

### 🖼️ Background System
- **Custom images** - Override theme backgrounds with personal images
- **Smart sizing** - Cover mode with proper aspect ratio
- **Theme compatibility** - Works with all custom themes
- **Per-theme storage** - Separate backgrounds for dark/light modes

## 🚀 Quick Start

### Desktop App
```bash
# Clone and install
git clone https://github.com/nowyback/todoodle.git
cd todoodle
npm install

# Start desktop app
npm start
```

### Console Version
```bash
# Local console (JSON storage)
npm run console

# Server console (with sync)
npm run console-server
```

### API Server
```bash
# Start server
npm run server

# Server with custom address
HOST=todoodle.example PORT=3001 npm run server
```

## 📋 Available Scripts

```bash
npm start              # Start desktop app
npm run console        # Start console version (local)
npm run console-server # Start console version (server sync)
npm run server         # Start API server
npm run dev            # Development mode
npm run dist-win       # Build Windows installer
```

## 🔧 Configuration

### Server Configuration
Configure server address and port through the desktop app:
1. Press `Ctrl+P` to open port configuration
2. Enter address in format: `address:port`
3. Examples:
   - `todoodle.example:3001` (domain)
   - `127.0.0.1:3001` (IP address)
   - `localhost:3001` (local)

### Theme Customization
1. Copy `src/themes/TEMPLATE.theme.template`
2. Rename to `your-theme.theme.css`
3. Modify CSS variables for colors and styles
4. Drop in `src/themes/` folder
5. Select in app settings (Ctrl+B)

### Background Images
1. Press `Ctrl+B` to open theme settings
2. Click "Browse" to select image file
3. Background automatically applies and overrides theme

## 📊 Features

### Desktop App Features
- **Progress Tracking**: Color-coded progress (Red→Orange→Yellow→Green→Purple)
- **Categories**: Organize tasks with custom categories
- **Notes**: Add detailed descriptions to tasks
- **Priority Detection**: Automatic priority based on keywords
- **Keyboard Shortcuts**: Power user efficiency
- **Local Storage**: Data persistence without server

### Console Features
- **Command Management**: Full CRUD operations via CLI
- **Progress Tracking**: Set and monitor task progress
- **Category System**: Organize and filter tasks
- **Search**: Find tasks by text or notes
- **Statistics**: Completion metrics and insights
- **Server Sync**: Optional API server integration

### API Features
- **OpenAPI Docs**: Interactive API documentation
- **Flexible Config**: Support for domains, IPs, and ports
- **CRUD Operations**: Complete todo management
- **Statistics**: Analytics and reporting
- **Health Monitoring**: Server status endpoints

## 🌐 Usage Examples

### Desktop Workflow
```bash
# Start app
npm start

# Add tasks with categories
# Use Ctrl+B for themes and backgrounds
# Use Ctrl+P for server configuration
```

### Console Workflow
```bash
# Start console
npm run console

# Add tasks
add "Finish project" Work
add "Buy groceries" Shopping

# Track progress
progress 1 75
toggle 2

# Search and stats
search "project"
stats
```

### Server Setup
```bash
# Start server
npm run server

# Configure custom address
# Use Ctrl+P in desktop app
# Enter: todoodle.example:3001
```

## 📁 Project Structure

```
todoodle/
├── src/
│   ├── themes/              # Custom themes
│   │   ├── dark-matter.theme.css
│   │   ├── fallout-terminal.theme.css
│   │   ├── translucent.theme.css
│   │   └── TEMPLATE.theme.template
│   ├── main.js             # Electron main process
│   ├── script.js           # Frontend logic
│   ├── styles.css          # App styling
│   ├── index.html          # Main HTML
│   └── api-server.js       # REST API server
├── docs/                   # Documentation
├── console.js              # Console version
├── console-server.js       # Server-enabled console
└── themes/                 # Copied themes for GitHub Pages
```

## 🔍 API Endpoints

### Todo Management
- `GET /api/todos` - List all todos
- `POST /api/todos` - Create new todo
- `PUT /api/todos/:id` - Update todo
- `DELETE /api/todos/:id` - Delete todo

### Configuration
- `PUT /api/config/server` - Update address and port
- `GET /api/health` - Server health check

### Documentation
- `GET /api-docs` - Interactive OpenAPI docs

## 🎯 Keyboard Shortcuts

### Desktop App
- `Ctrl+N` - New task
- `Ctrl+B` - Theme settings
- `Ctrl+P` - Port configuration
- `Ctrl+D` - Toggle dark/light mode

### Console
- `help` - Show all commands
- `clear` - Clear screen
- `exit` - Quit application

## 📱 Mobile & PWA

- **PWA Ready** - Works on mobile browsers
- **Capacitor Support** - Native mobile app development
- **Responsive Design** - Adapts to all screen sizes

## 🛠️ Development

### Building for Production
```bash
# Windows installer
npm run dist-win

# Portable version
npm run portable
```

### Mobile Development
```bash
# Setup Capacitor
npm run capacitor:add

# Sync and build
npm run capacitor:sync
npm run capacitor:open
```

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/nowyback/todoodle/issues)
- **Documentation**: [docs/](docs/)
- **Releases**: [Latest Release](https://github.com/nowyback/todoodle/releases)

---

**Made with ❤️ for developers who want power and simplicity**

### Option 1: Install as Windows App (Recommended)
```bash
# Download the latest installer from dist/ folder
# Run Todoodle Setup 0.7.1.exe
# Install and search "Todoodle" in Windows Start Menu
```

### Option 2: Development Mode
```bash
# Install dependencies
npm install

# Start the desktop app
npm start

# Development mode with DevTools
npm run dev
```

### API Server
```bash
# Start API server (default port 3001)
npm run api

# Development mode
npm run api-dev
```

### Access Points
- **Desktop App**: Launches automatically
- **API Documentation**: http://localhost:3001/api-docs
- **Health Check**: http://localhost:3001/api/health
- **Port Configuration**: Use Ctrl+P in the app

## 🎮 Usage

### Desktop App
- **Ctrl+N**: Focus new task input
- **Ctrl+D**: Toggle dark/light theme
- **Ctrl+P**: Open port configuration
- **Drag sliders** to adjust task progress
- **Click categories** to filter tasks
- **Add notes** for detailed task information

### API Endpoints
```bash
# Get all todos
GET /api/todos

# Create todo
POST /api/todos
{
  "text": "Fix the bug",
  "note": "Check authentication",
  "category": "Development",
  "priority": "high",
  "progress": 25
}

# Update todo
PUT /api/todos/:id

# Delete todo
DELETE /api/todos/:id

# Get categories
GET /api/todos/categories

# Get statistics
GET /api/todos/stats

# Update port
PUT /api/config/port
{
  "port": 3002
}
```

## 📁 Project Structure

```
├── src/
│   ├── main.js           # Electron main process
│   ├── preload.js        # Electron preload script
│   ├── index.html        # Desktop app UI
│   ├── styles.css        # Styling
│   ├── script.js         # Frontend logic
│   ├── api-server.js     # Express API server
│   ├── logo.svg          # Custom app logo
│   └── icon.ico          # Windows icon (convert from SVG)
├── dist/                 # Built executables
├── package.json          # Dependencies and scripts
├── create-shortcut.bat   # Desktop shortcut creator
└── README.md             # This file
```

## 🛠️ Technology Stack

### Desktop App
- **Electron** - Cross-platform desktop framework
- **Vanilla JavaScript** - No frontend framework dependencies
- **CSS Variables** - Dynamic theming
- **Local Storage** - Client-side persistence

### API Server
- **Express.js** - Web framework
- **Swagger/OpenAPI** - API documentation
- **CORS** - Cross-origin requests
- **JSON File Storage** - Simple data persistence

## 🎨 Customization

### Logo & Branding
- **Logo**: Edit `src/logo.svg` - rounded corner design with black background
- **Icon**: Convert `src/logo.svg` to `src/icon.ico` for Windows
- **Recommended Converter**: https://convertio.co/svg-ico/

### Themes
The app uses CSS variables for easy theming:
```css
:root {
  --primary-color: #6366f1;
  --background: #020202;
  --text-primary: #ffffff;
  /* ... more variables */
}
```

### Categories
Add custom categories through the UI:
1. Type category name in "Add new category"
2. Press Enter or click "Add Category"
3. Select category when creating tasks

## 🔧 Configuration

### Port Configuration
- **UI**: Press Ctrl+P → Enter new port → Update
- **API**: `PUT /api/config/port` with `{"port": 3002}`
- **File**: Creates `api-config.json` with port settings

### Data Storage
- **Desktop App**: `localStorage` (browser storage)
- **API Server**: `todos-api.json` (file-based)
- **Categories**: `localStorage` (browser storage)

## 📝 Development

### Adding Features
1. **Frontend**: Edit `script.js` and `styles.css`
2. **API**: Modify `api-server.js`
3. **Electron**: Update `main.js` or `preload.js`

### Building for Production
```bash
# Create Windows installer
npm run dist-win

# Create portable executable
npm run portable

# Package without installer (for testing)
npm run pack
```

### Installation & Distribution
- **Installer**: `dist/Todoodle Setup 0.7.1.exe` - Full Windows installer with Start Menu integration
- **Portable**: Run `npm run portable` for standalone executable
- **Desktop Shortcut**: Use `create-shortcut.bat` for quick access during development

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Donating

To help me further programm stuff, please consider donating to my patreon: https://www.patreon.com/nowyback

## License

MIT License - feel free to use this project for personal or commercial purposes.

## Elements and Base

- **Electron** for the desktop framework
- **Express.js** for the API server
- **Swagger UI** for API documentation
- **Inter Font** for the beautiful typography

---

**Made with love by CHROMESHOT Studios**
