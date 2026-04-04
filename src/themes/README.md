# Custom Themes

Create beautiful, personalized themes for Todoodle with our comprehensive theming system. Themes support custom colors, glass morphism effects, animations, and complete UI customization.

## 🎨 Theme System Features

### ✨ Auto-Detection
- **Drop-in themes** - Just place `.theme.css` files in `src/themes/`
- **Instant loading** - Themes appear immediately in settings (Ctrl+B)
- **No restart required** - Switch themes on the fly
- **Dynamic loading** - Automatic theme discovery

### 🌈 Theme Capabilities
- **Custom colors** - Complete color scheme customization
- **Glass morphism** - Modern frosted glass effects
- **Animations** - Smooth transitions and hover effects
- **Dark/Light modes** - Full support for both themes
- **Background override** - Custom images work with themes
- **Responsive design** - Adapts to all screen sizes

## 📁 Theme Location
```
src/themes/
├── dark-matter.theme.css      # Built-in theme
├── fallout-terminal.theme.css # Built-in theme  
├── translucent.theme.css      # Built-in theme
├── example-custom.theme.css  # Example theme
└── TEMPLATE.theme.template    # Starting template
```

## 🎯 Available Themes

### Dark Matter Theme (`dark-matter.theme.css`)
- **Aesthetic**: Cold, dark & frosty space theme
- **Colors**: Blue accent colors (#25ace8)
- **Features**: Dark backgrounds with subtle highlights
- **Best for**: Development, late-night work

### Fallout Terminal Theme (`fallout-terminal.theme.css`)
- **Aesthetic**: Green phosphor terminal from Fallout 4
- **Colors**: Retro green (#00ff00) on dark background
- **Features**: Monospace font, CRT scanline effects, flickering text
- **Best for**: Terminal lovers, retro computing

### Translucent Theme (`translucent.theme.css`)
- **Aesthetic**: Modern glass morphism design
- **Colors**: Transparent with colorful accents
- **Features**: Heavy blur effects, frosted glass containers
- **Best for**: Modern UI, minimalist workflows

### Example Custom Theme (`example-custom.theme.css`)
- **Aesthetic**: Demonstration theme with warm colors
- **Colors**: Orange/purple gradient scheme
- **Features**: Shows all theme capabilities
- **Best for**: Learning theme creation

## 🚀 Creating Custom Themes

### Step 1: Use the Template
1. **Copy the template**:
   ```bash
   cp src/themes/TEMPLATE.theme.template src/themes/your-theme.theme.css
   ```

2. **Rename file** - Use kebab-case: `your-theme-name.theme.css`

### Step 2: Customize Colors
Edit the CSS variables in your theme file:

```css
:root {
  /* Background Colors */
  --background: #1a1a1a;
  --surface: #2d2d2d;
  --surface-light: #3d3d3d;
  
  /* Text Colors */
  --text: #ffffff;
  --text-secondary: #cccccc;
  --text-muted: #888888;
  
  /* Accent Colors */
  --primary-color: #0066cc;
  --primary-hover: #0055aa;
  --success-color: #28a745;
  --warning-color: #ffc107;
  --danger-color: #dc3545;
  
  /* Glass Morphism */
  --glass-bg: rgba(255, 255, 255, 0.1);
  --glass-border: rgba(255, 255, 255, 0.2);
  --glass-shadow: rgba(0, 0, 0, 0.3);
  
  /* UI Elements */
  --border-radius: 8px;
  --transition: all 0.3s ease;
}

/* Light mode support */
[data-theme="light"] {
  --background: #ffffff;
  --surface: #f8f9fa;
  --surface-light: #e9ecef;
  --text: #212529;
  --text-secondary: #6c757d;
  --text-muted: #adb5bd;
  --glass-bg: rgba(0, 0, 0, 0.05);
  --glass-border: rgba(0, 0, 0, 0.1);
  --glass-shadow: rgba(0, 0, 0, 0.1);
}
```

### Step 3: Style UI Elements
```css
/* Glass morphism containers */
.glass-container {
  background: var(--glass-bg);
  backdrop-filter: blur(10px);
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius);
  box-shadow: 0 8px 32px var(--glass-shadow);
  transition: var(--transition);
}

.glass-container:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 40px var(--glass-shadow);
}

/* Buttons */
.btn-primary {
  background: var(--primary-color);
  color: white;
  border: none;
  border-radius: var(--border-radius);
  transition: var(--transition);
}

.btn-primary:hover {
  background: var(--primary-hover);
  transform: translateY(-1px);
}

/* Todo items */
.todo-item {
  background: var(--surface);
  border-left: 4px solid var(--primary-color);
  border-radius: var(--border-radius);
  transition: var(--transition);
}

.todo-item:hover {
  background: var(--surface-light);
  transform: translateX(4px);
}
```

### Step 4: Add Your Theme
1. **Save your file** as `your-theme.theme.css`
2. **Place in folder** - `src/themes/`
3. **Open Todoodle** - Press `Ctrl+B`
4. **Select theme** - Your theme appears in dropdown
5. **Apply theme** - Click "Apply" to activate

## 🎨 Advanced Theme Features

### 🌟 Animations
```css
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

.todo-item {
  animation: fadeIn 0.3s ease-out;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.7; }
}

.loading {
  animation: pulse 1.5s infinite;
}
```

### 🎭 Hover Effects
```css
.interactive-element {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.interactive-element:hover {
  transform: scale(1.05);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}
```

### 🌈 Gradient Support
```css
.gradient-bg {
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
}

.gradient-text {
  background: linear-gradient(45deg, var(--text), var(--primary-color));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
```

### 🎪 Custom Fonts
```css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

body {
  font-family: 'Inter', sans-serif;
}

.mono-font {
  font-family: 'Fira Code', 'Courier New', monospace;
}
```

## 🎯 Theme Design Tips

### Color Theory
- **Contrast**: Ensure text is readable against backgrounds
- **Consistency**: Use consistent color palette throughout
- **Accessibility**: Test color combinations for accessibility
- **Mood**: Choose colors that match your intended aesthetic

### Glass Morphism Best Practices
- **Blur**: Use `backdrop-filter: blur()` for glass effect
- **Transparency**: Keep backgrounds semi-transparent
- **Borders**: Add subtle borders for depth
- **Shadows**: Use soft shadows for elevation

### Performance
- **Transitions**: Keep animations smooth but not excessive
- **Complex selectors**: Avoid overly complex CSS selectors
- **Images**: Optimize background images for size
- **Variables**: Use CSS variables for maintainability

## 🧪 Testing Your Theme

### Visual Testing
1. **Test all UI elements** - Buttons, inputs, modals
2. **Check text readability** - Ensure good contrast
3. **Test hover states** - Verify animations work
4. **Check responsiveness** - Test on different screen sizes

### Theme Switching
1. **Toggle dark/light modes** - Ensure both work
2. **Switch themes** - Verify smooth transitions
3. **Background images** - Test with custom backgrounds
4. **Save/restore** - Ensure theme persistence works

### Cross-Platform
1. **Windows/Mac/Linux** - Test on different OS
2. **Different browsers** - Chrome, Firefox, Edge
3. **High DPI displays** - Test scaling
4. **Color blind users** - Test accessibility

## 🎨 Theme Inspiration

### Popular Color Schemes
```css
/* Ocean Theme */
--primary-color: #0077be;
--background: #001f3f;
--surface: #003366;

/* Forest Theme */
--primary-color: #228b22;
--background: #1a3d1a;
--surface: #2d5a2d;

/* Sunset Theme */
--primary-color: #ff6b35;
--background: #2d1b1b;
--surface: #4a2c2c;

/* Cyberpunk Theme */
--primary-color: #00ff41;
--background: #0d0d0d;
--surface: #1a1a1a;
```

### Theme Ideas
- **Developer**: Dark mode with syntax highlighting colors
- **Minimalist**: Clean, simple, high contrast
- **Nature**: Earth tones with organic colors
- **Space**: Dark with star-like accents
- **Retro**: Vintage computer terminal colors
- **Neon**: Bright, vibrant, glowing effects

## 🔧 Troubleshooting

### Common Issues

#### Theme Not Appearing
- **Check file extension** - Must end with `.theme.css`
- **Check location** - Must be in `src/themes/` folder
- **Restart app** - Sometimes requires app restart
- **Check syntax** - CSS errors can prevent loading

#### Colors Not Applying
- **Check CSS variables** - Ensure variables are defined
- **Check specificity** - Use more specific selectors if needed
- **Check !important** - Use sparingly for overrides
- **Check cache** - Clear browser cache if needed

#### Glass Effects Not Working
- **Check backdrop-filter** - Ensure browser supports it
- **Check transparency** - Ensure backgrounds are semi-transparent
- **Check blur amount** - Adjust blur radius as needed
- **Check fallbacks** - Provide solid color fallbacks

### Debug Mode
Add this to your theme to debug:
```css
/* Debug borders */
* {
  outline: 1px solid red !important;
}

/* Show variable values */
.debug::before {
  content: var(--primary-color);
  color: white;
  background: red;
}
```

## 📚 Resources

### CSS References
- [CSS Variables Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- [Backdrop Filter](https://developer.mozilla.org/en-US/docs/Web/CSS/backdrop-filter)
- [CSS Animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations)

### Design Inspiration
- [Coolors](https://coolors.co/) - Color palette generator
- [Google Fonts](https://fonts.google.com/) - Free fonts
- [CSS Tricks](https://css-tricks.com/) - CSS techniques
- [Dribbble](https://dribbble.com/) - Design inspiration

### Tools
- [CSS Variables Inspector](https://css-var-inspector.herokuapp.com/)
- [Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [CSS Gradient Generator](https://cssgradient.io/)

## 🤝 Contributing Themes

### Share Your Theme
1. **Create theme** following the guidelines above
2. **Test thoroughly** - Ensure it works well
3. **Add documentation** - Include color palette and features
4. **Submit pull request** - Share with the community

### Theme Guidelines
- **Follow naming convention** - `theme-name.theme.css`
- **Include both modes** - Support dark and light themes
- **Test accessibility** - Ensure good contrast
- **Keep it clean** - Well-organized, commented code

---

**Happy theming!** 🎨✨

Create beautiful, personalized themes that make Todoodle uniquely yours!
- Red accent color theme (#ff6b6b)
- Demonstrates how to create custom themes
- Copy this file as a starting point
- Includes both dark and light mode support

## How to Use

1. **Drop theme files** in this folder (`.theme.css` format)
2. **Open theme settings** (Ctrl+B)
3. **Select your theme** from the dropdown
4. **Click Apply** to activate

## Creating Your Own Theme

### Quick Start
1. **Copy** `example-custom.theme.css` 
2. **Rename** it to `your-theme-name.theme.css`
3. **Modify colors** and styles
4. **Drop it in this folder**

### Theme Structure
```css
/* Your theme name - File: your-theme-name.theme.css */

:root {
  /* Main colors */
  --primary-color: #your-accent-color;
  --primary-hover: #your-hover-color;
  --background: #your-bg-color;
  --surface: #your-surface-color;
  --text: #your-text-color;
  --text-secondary: #your-secondary-text;
  --text-muted: #your-muted-text;
  --border: #your-border-color;
  
  /* Glass morphism effects */
  --glass-bg: rgba(your-colors, 0.1);
  --glass-bg-hover: rgba(your-colors, 0.2);
  --glass-border: rgba(your-colors, 0.3);
  --glass-border-hover: rgba(your-colors, 0.5);
  --glass-blur: 15px;
  --glass-shadow: 0 8px 32px rgba(your-colors, 0.1);
  --glass-shadow-hover: 0 12px 48px rgba(your-colors, 0.2);
  
  /* Border radius */
  --app-radius: 20px;
  --card-radius: 16px;
  --button-radius: 12px;
}

/* Apply styles to elements */
.header { /* your styles */ }
.todo-item { /* your styles */ }
.add-btn, .port-btn { /* your styles */ }

/* Light mode support */
[data-theme="light"] {
  /* Light mode colors */
}
```

## Theme Variables

### Colors
- `--primary-color`: Main accent color for buttons and highlights
- `--primary-hover`: Hover state for primary elements
- `--background`: Main app background
- `--surface`: Card/container backgrounds
- `--text`: Primary text color
- `--text-secondary`: Secondary text color
- `--text-muted`: Muted/disabled text color
- `--border`: Border color for elements
- `--success`: Success state color
- `--warning`: Warning state color
- `--danger`: Error/danger color

### Glass Morphism
- `--glass-bg`: Background color for glass elements
- `--glass-bg-hover`: Hover state for glass elements
- `--glass-border`: Border color for glass elements
- `--glass-border-hover`: Hover border color
- `--glass-blur`: Backdrop blur amount
- `--glass-shadow`: Drop shadow for glass elements
- `--glass-shadow-hover`: Enhanced shadow on hover

### Border Radius
- `--app-radius`: Main app container radius
- `--card-radius`: Card/item radius
- `--button-radius`: Button radius

## Tips for Great Themes

✅ **Use `!important`** to override default styles
✅ **Test both modes** with `[data-theme="light"]` support
✅ **Ensure good contrast** for readability
✅ **Add hover effects** for better UX
✅ **Use glass morphism** for modern look
✅ **Keep file names simple** (use hyphens, no spaces)
✅ **Test in both Electron and browser**

## File Naming

- ✅ `my-cool-theme.theme.css`
- ✅ `dark-pro.theme.css`
- ✅ `neon-lights.theme.css`
- ❌ `My Theme.css` (spaces)
- ❌ `theme.txt` (wrong extension)

## Troubleshooting

**Theme not appearing?**
- Check file ends with `.theme.css`
- Verify file is in the correct folder
- Restart Todoodle and reopen settings

**Styles not applying?**
- Add `!important` to your CSS rules
- Check for CSS syntax errors
- Ensure element selectors are correct

**Colors look wrong?**
- Test with both dark and light modes
- Check color contrast ratios
- Verify CSS variable names are correct
