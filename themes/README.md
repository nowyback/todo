# Custom Themes

Place theme files in this folder to create custom visual styles for Todoodle.

## Location
This folder is located at: `src/themes/`

## Auto-Detection Feature
✨ **NEW**: Themes are automatically detected! Just drop `.theme.css` files in this folder and they'll appear in the theme selector immediately.

## Available Themes

### Dark Matter Theme (`dark-matter.theme.css`)
- Cold, dark & frosty aesthetic
- Blue accent colors (#25ace8)
- Dark backgrounds with subtle highlights

### Fallout 4 Terminal Theme (`fallout-terminal.theme.css`)
- Green phosphor terminal aesthetic
- Monospace font with CRT scanline effect
- Retro computer terminal feel
- Flickering text animation

### Translucent Theme (`translucent.theme.css`)
- Modern glass morphism design
- Heavy blur effects and transparency
- Frosted glass containers
- Smooth hover animations

### Example Custom Theme (`example-custom.theme.css`)
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
