# Todoodle - Branch Structure Guide

This repository uses multiple branches to organize different versions and deployment targets.

## 🌿 Branch Overview

### 📱 Main Branch (`main`)
- **Purpose**: Desktop application and core features
- **Content**: Electron app, themes, console versions
- **Target**: End users who want the desktop application
- **Installation**: `npm install && npm start`

### 🖥️ Server Branch (`server`)
- **Purpose**: Server-only deployment package
- **Content**: API server, console versions, Docker setup
- **Target**: Server administrators and developers
- **Installation**: Extract zip and run `npm install && npm run server`

### 📄 Documentation Branch (`gh-pages`)
- **Purpose**: GitHub Pages documentation
- **Content**: Download pages, setup guides
- **Target**: Users visiting the GitHub Pages site
- **URL**: `https://nowyback.github.io/todoodle`

## 🚀 Quick Start

### For Desktop Application
```bash
git clone https://github.com/nowyback/todoodle.git
cd todoodle
npm install
npm start
```

### For Server Deployment
```bash
git clone --branch server https://github.com/nowyback/todoodle.git
cd todoodle
npm install
npm run server
```

### For Documentation
Visit: https://nowyback.github.io/todoodle

## 📁 Branch Contents

### Main Branch (`main`)
```
todoodle/
├── src/                    # Desktop app source
├── themes/                 # Theme files
├── docs/                   # Documentation
├── console.js              # Console version
├── package.json             # Desktop dependencies
└── ...                    # Other desktop files
```

### Server Branch (`server`)
```
todoodle/
├── server-setup/           # Server installation package
├── api-server.js          # Main server application
├── console-server.js       # Server-enabled console
├── Dockerfile             # Docker configuration
├── install.sh             # Linux/Mac installer
├── install.bat            # Windows installer
└── todoodle-server-v*.zip  # Pre-packaged server
```

### Documentation Branch (`gh-pages`)
```
todoodle/
├── download.html          # Download page
├── index.html            # Landing page
├── SERVER_SETUP.md       # Server setup guide
├── CONSOLE.md            # Console guide
└── ...                   # Other documentation
```

## 🔄 Switching Between Branches

### Switch to Desktop (main)
```bash
git checkout main
```

### Switch to Server
```bash
git checkout server
```

### Switch to Documentation
```bash
git checkout gh-pages
```

## 🎯 Use Cases

### 🖥️ Desktop Application (main)
- **Who**: End users who want a desktop todo app
- **Why**: Full-featured desktop application with themes
- **Features**: 
  - Electron app with custom themes
  - Local storage
  - Background images
  - Keyboard shortcuts
  - Progress tracking

### 🌐 Server Deployment (server)
- **Who**: Server administrators, developers, teams
- **Why**: Centralized todo management with API
- **Features**:
  - REST API server
  - Console versions with sync
  - Docker deployment
  - Multi-user access
  - API documentation

### 📚 Documentation (gh-pages)
- **Who**: Anyone visiting the project website
- **Why**: Information and downloads
- **Features**:
  - Download pages
  - Setup guides
  - Feature documentation
  - GitHub Pages hosting

## 🔧 Development Workflow

### Making Changes

#### For Desktop Features
1. Switch to main: `git checkout main`
2. Make changes
3. Test desktop app
4. Commit and push to main

#### For Server Features
1. Switch to server: `git checkout server`
2. Make changes
3. Test server deployment
4. Commit and push to server

#### For Documentation
1. Switch to gh-pages: `git checkout gh-pages`
2. Update documentation
3. Test GitHub Pages
4. Commit and push to gh-pages

### Merging Changes

#### Server to Main
If you add server features that should be in desktop:
```bash
git checkout main
git merge server
```

#### Main to Server
If you add desktop features needed in server:
```bash
git checkout server
git merge main
```

## 📦 Releases

### Desktop Releases
- **Branch**: `main`
- **Format**: `.exe` installers
- **Location**: GitHub Releases

### Server Releases
- **Branch**: `server`
- **Format**: `.zip` packages
- **Location**: GitHub Releases

### Documentation Updates
- **Branch**: `gh-pages`
- **Format**: Static HTML pages
- **Location**: GitHub Pages

## 🤝 Contributing

### Choose Your Target
1. **Desktop App** → Contribute to `main`
2. **Server** → Contribute to `server`
3. **Documentation** → Contribute to `gh-pages`

### Pull Requests
- Target the appropriate branch
- Describe the purpose
- Include testing steps
- Follow branch conventions

---

**Choose the branch that matches your needs!** 🚀✨

- **Desktop App**: `main` branch
- **Server**: `server` branch  
- **Documentation**: `gh-pages` branch
