#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

class ServerConsoleTodoApp {
    constructor() {
        this.todos = [];
        this.categories = ['General'];
        this.currentCategory = 'all';
        this.dataFile = path.join(__dirname, 'todos-console.json');
        this.serverUrl = 'http://localhost:3001';
        this.useServer = false;
        this.loadTodos();
        this.loadCategories();
        this.checkServer();
    }

    async checkServer() {
        try {
            const response = await fetch(`${this.serverUrl}/api/health`, {
                method: 'GET',
                timeout: 2000
            });
            if (response.ok) {
                this.useServer = true;
                console.log('🌐 Connected to Todoodle server');
                await this.loadFromServer();
            }
        } catch (error) {
            this.useServer = false;
            console.log('💾 Using local storage (server not available)');
        }
    }

    async loadFromServer() {
        try {
            const response = await fetch(`${this.serverUrl}/api/todos`);
            if (response.ok) {
                this.todos = await response.json();
                this.loadCategories();
                console.log('📥 Loaded todos from server');
            }
        } catch (error) {
            console.log('❌ Failed to load from server, using local storage');
            this.loadTodos();
        }
    }

    async saveToServer(todo) {
        if (!this.useServer) return false;

        try {
            const response = await fetch(`${this.serverUrl}/api/todos`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(todo)
            });
            return response.ok;
        } catch (error) {
            console.log('❌ Failed to save to server');
            return false;
        }
    }

    async updateOnServer(id, todo) {
        if (!this.useServer) return false;

        try {
            const response = await fetch(`${this.serverUrl}/api/todos/${id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(todo)
            });
            return response.ok;
        } catch (error) {
            console.log('❌ Failed to update on server');
            return false;
        }
    }

    async deleteFromServer(id) {
        if (!this.useServer) return false;

        try {
            const response = await fetch(`${this.serverUrl}/api/todos/${id}`, {
                method: 'DELETE'
            });
            return response.ok;
        } catch (error) {
            console.log('❌ Failed to delete from server');
            return false;
        }
    }

    loadTodos() {
        try {
            if (fs.existsSync(this.dataFile)) {
                const data = fs.readFileSync(this.dataFile, 'utf8');
                this.todos = JSON.parse(data);
            }
        } catch (error) {
            console.log('No existing todos found, starting fresh.');
        }
    }

    async saveTodos() {
        if (this.useServer) {
            // Server mode - individual API calls
            return;
        }
        
        // Local storage mode
        try {
            fs.writeFileSync(this.dataFile, JSON.stringify(this.todos, null, 2));
        } catch (error) {
            console.error('Error saving todos:', error.message);
        }
    }

    loadCategories() {
        const categories = [...new Set(this.todos.map(todo => todo.category).filter(Boolean))];
        if (categories.length > 0) {
            this.categories = ['General', ...categories];
        }
    }

    async addTodo(text, category = 'General') {
        const todo = {
            id: Date.now().toString(),
            text: text,
            completed: false,
            category: category,
            progress: 0,
            createdAt: new Date().toISOString(),
            note: ''
        };

        if (this.useServer) {
            const success = await this.saveToServer(todo);
            if (success) {
                this.todos.push(todo);
                console.log(`✅ Added to server: "${text}"`);
            } else {
                console.log(`❌ Failed to add to server: "${text}"`);
            }
        } else {
            this.todos.push(todo);
            this.saveTodos();
            console.log(`✅ Added locally: "${text}"`);
        }

        this.loadCategories();
    }

    async toggleTodo(id) {
        const todo = this.todos.find(t => t.id === id);
        if (todo) {
            todo.completed = !todo.completed;
            todo.progress = todo.completed ? 100 : 0;

            if (this.useServer) {
                const success = await this.updateOnServer(id, todo);
                if (success) {
                    console.log(`✓ Updated on server: "${todo.text}"`);
                } else {
                    console.log(`❌ Failed to update on server: "${todo.text}"`);
                }
            } else {
                this.saveTodos();
                console.log(`✓ Updated locally: "${todo.text}"`);
            }
        } else {
            console.log('❌ Todo not found');
        }
    }

    async deleteTodo(id) {
        const index = this.todos.findIndex(t => t.id === id);
        if (index !== -1) {
            const deleted = this.todos.splice(index, 1)[0];

            if (this.useServer) {
                const success = await this.deleteFromServer(id);
                if (success) {
                    console.log(`🗑️ Deleted from server: "${deleted.text}"`);
                } else {
                    console.log(`❌ Failed to delete from server: "${deleted.text}"`);
                }
            } else {
                this.saveTodos();
                console.log(`🗑️ Deleted locally: "${deleted.text}"`);
            }
        } else {
            console.log('❌ Todo not found');
        }
    }

    async updateProgress(id, progress) {
        const todo = this.todos.find(t => t.id === id);
        if (todo) {
            todo.progress = Math.max(0, Math.min(100, progress));
            todo.completed = todo.progress === 100;

            if (this.useServer) {
                const success = await this.updateOnServer(id, todo);
                if (success) {
                    console.log(`📊 Updated on server: "${todo.text}" - ${todo.progress}%`);
                } else {
                    console.log(`❌ Failed to update on server: "${todo.text}"`);
                }
            } else {
                this.saveTodos();
                console.log(`📊 Updated locally: "${todo.text}" - ${todo.progress}%`);
            }
        } else {
            console.log('❌ Todo not found');
        }
    }

    async addNote(id, note) {
        const todo = this.todos.find(t => t.id === id);
        if (todo) {
            todo.note = note;

            if (this.useServer) {
                const success = await this.updateOnServer(id, todo);
                if (success) {
                    console.log(`📝 Updated note on server: "${todo.text}"`);
                } else {
                    console.log(`❌ Failed to update note on server: "${todo.text}"`);
                }
            } else {
                this.saveTodos();
                console.log(`📝 Updated note locally: "${todo.text}"`);
            }
        } else {
            console.log('❌ Todo not found');
        }
    }

    listTodos() {
        const filteredTodos = this.currentCategory === 'all' 
            ? this.todos 
            : this.todos.filter(todo => todo.category === this.currentCategory);

        if (filteredTodos.length === 0) {
            console.log('📝 No todos found');
            return;
        }

        const mode = this.useServer ? '🌐 Server' : '💾 Local';
        console.log(`\n📋 Todos (${this.currentCategory === 'all' ? 'All' : this.currentCategory}) [${mode}]:\n`);
        
        filteredTodos.forEach((todo, index) => {
            const status = todo.completed ? '✅' : '⭕';
            const progressBar = todo.progress > 0 ? `[${todo.progress}%]` : '';
            const note = todo.note ? `\n   📝 ${todo.note}` : '';
            
            console.log(`${index + 1}. ${status} ${todo.text} ${progressBar} (${todo.category})${note}`);
        });
        
        console.log(`\n📊 Stats: ${filteredTodos.filter(t => t.completed).length}/${filteredTodos.length} completed`);
    }

    showServerStatus() {
        console.log(`\n🌐 Server Status: ${this.useServer ? '✅ Connected' : '❌ Disconnected'}`);
        console.log(`📡 Server URL: ${this.serverUrl}`);
        console.log(`💾 Storage Mode: ${this.useServer ? 'Server' : 'Local JSON'}`);
        
        if (this.useServer) {
            console.log(`📥 Todos loaded from server`);
            console.log(`📤 Changes will sync to server`);
        } else {
            console.log(`📁 Local file: ${this.dataFile}`);
            console.log(`🔄 Start server to enable sync`);
        }
    }

    async syncWithServer() {
        if (!this.useServer) {
            console.log('❌ Server not available');
            return;
        }

        console.log('🔄 Syncing with server...');
        await this.loadFromServer();
        console.log('✅ Sync completed');
    }

    // Include all other methods from the original ConsoleTodoApp...
    listCategories() {
        console.log('\n📁 Categories:');
        this.categories.forEach((cat, index) => {
            const count = cat === 'all' ? this.todos.length : this.todos.filter(t => t.category === cat).length;
            const current = cat === this.currentCategory ? ' ←' : '';
            console.log(`${index + 1}. ${cat} (${count})${current}`);
        });
    }

    setCategory(category) {
        if (category === 'all' || this.categories.includes(category)) {
            this.currentCategory = category;
            console.log(`📁 Switched to: ${category === 'all' ? 'All Categories' : category}`);
        } else {
            console.log('❌ Category not found');
        }
    }

    addCategory(name) {
        if (!this.categories.includes(name) && name !== 'all') {
            this.categories.push(name);
            console.log(`📁 Added category: ${name}`);
        } else {
            console.log('❌ Category already exists');
        }
    }

    searchTodos(query) {
        const results = this.todos.filter(todo => 
            todo.text.toLowerCase().includes(query.toLowerCase()) ||
            todo.note.toLowerCase().includes(query.toLowerCase())
        );

        if (results.length === 0) {
            console.log(`🔍 No results found for: "${query}"`);
            return;
        }

        console.log(`\n🔍 Search results for "${query}":\n`);
        results.forEach((todo, index) => {
            const status = todo.completed ? '✅' : '⭕';
            const note = todo.note ? `\n   📝 ${todo.note}` : '';
            console.log(`${index + 1}. ${status} ${todo.text} (${todo.category})${note}`);
        });
    }

    showStats() {
        const total = this.todos.length;
        const completed = this.todos.filter(t => t.completed).length;
        const pending = total - completed;
        const completionRate = total > 0 ? Math.round((completed / total) * 100) : 0;

        console.log('\n📊 Statistics:');
        console.log(`   Total todos: ${total}`);
        console.log(`   Completed: ${completed}`);
        console.log(`   Pending: ${pending}`);
        console.log(`   Completion rate: ${completionRate}%`);
        console.log(`   Storage: ${this.useServer ? 'Server' : 'Local'}`);

        console.log('\n📁 Categories:');
        this.categories.filter(cat => cat !== 'all').forEach(cat => {
            const catTodos = this.todos.filter(t => t.category === cat);
            const catCompleted = catTodos.filter(t => t.completed).length;
            console.log(`   ${cat}: ${catCompleted}/${catTodos.length}`);
        });
    }

    showHelp() {
        console.log(`
📝 Todoodle Console Server - Commands:

📋 BASIC:
  add <text> [category]     Add new todo
  list                      List todos
  list-categories           List categories
  category <name>           Switch to category
  
🔧 TODO MANAGEMENT:
  toggle <id>               Toggle todo completion
  delete <id>               Delete todo
  progress <id> <0-100>     Set progress (0-100)
  note <id> <text>          Add note to todo
  
🌐 SERVER FEATURES:
  status                    Show server status
  sync                      Sync with server
  
📁 CATEGORIES:
  add-category <name>       Add new category
  set-category <name>       Switch to category
  
🔍 SEARCH & STATS:
  search <query>            Search todos
  stats                     Show statistics
  
🎯 OTHER:
  help                      Show this help
  clear                     Clear screen
  exit/quit                 Exit app

💡 SERVER MODE:
  Start server: npm run server
  Start console: npm run console
  Auto-detects server and syncs data

🚀 EXAMPLES:
  add "Buy milk" Shopping
  add "Finish project" Work
  toggle 1
  progress 2 75
  note 3 "Remember to review"
  search "milk"
  category Shopping
  status                    # Show server status
  sync                      # Manual sync
`);
    }

    clearScreen() {
        console.clear();
    }
}

// Use the ServerConsoleTodoApp instead of ConsoleTodoApp
if (require.main === module) {
    const consoleApp = new ServerConsoleTodoApp();
    
    // You can reuse the same ConsoleInterface class from the original
    // Just replace ConsoleTodoApp with ServerConsoleTodoApp
    console.log('🌐 Todoodle Console with Server Support!');
    console.log('Type "help" for commands or "exit" to quit.\n');
    console.log('💡 Start the server with "npm run server" for sync features\n');
    
    // For now, just show help and exit
    consoleApp.showHelp();
}

module.exports = ServerConsoleTodoApp;
