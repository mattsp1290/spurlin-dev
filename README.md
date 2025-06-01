# 🎮 Spurlin.dev - Pixel Perfect TIC-80 Web Experience

A personal developer website that celebrates retro gaming aesthetics through the lens of TIC-80's SWEETIE-16 palette. Built with Hugo static site generator and a custom TIC-80-inspired design system, this site blends fantasy console nostalgia with modern web development practices.

## ✨ Features

- **TIC-80 Design System**: Complete CSS framework using the SWEETIE-16 palette
- **Pixel Perfect**: Maintains crisp rendering at all scale factors (1x, 2x, 3x, 4x)
- **Retro Effects**: Starfield backgrounds, color cycling, and optional sound effects
- **Modern Performance**: Built with Hugo for lightning-fast static generation
- **Accessibility First**: Maintains modern accessibility standards with retro aesthetics

## 🚀 Quick Start

### Prerequisites

- Hugo Extended version 0.120.0+ (for SCSS support)
- Git 2.40.0+
- Node.js 18+ (for future build scripts)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/spurlin-dev.git
   cd spurlin-dev
   ```

2. **Verify Hugo installation**:
   ```bash
   hugo version
   # Should show: hugo v0.147.7+extended...
   ```

3. **Start the development server**:
   ```bash
   hugo server --buildDrafts --buildFuture
   # Navigate to http://localhost:1313
   ```

## 📁 Project Structure

```
spurlin-dev/
├── assets/              # Design system & processed assets
│   └── scss/
│       └── tic80/      # TIC-80 design system (SWEETIE-16)
├── content/             # All content
│   ├── blog/           # Technical blog posts
│   ├── projects/       # Portfolio items
│   ├── styleguide/     # TIC-80 component documentation
│   └── about/          # Personal pages
├── layouts/            # Template overrides
│   └── _default/       # Custom TIC-80 templates
├── themes/             # Neocities Revival theme
│   └── neocities-revival/
│       ├── assets/scss/tic80/  # Theme TIC-80 styles
│       └── layouts/            # TIC-80 templates
├── proompts/           # Project documentation
│   ├── docs/           # TIC-80 usage guides
│   └── tasks/          # Development tasks
├── static/             # Static files
│   ├── images/badges/  # TIC-80 style badges
│   └── fonts/          # Pixel fonts
└── config.toml         # Hugo configuration
```

## 🎨 TIC-80 Design System

The site uses a complete design system inspired by TIC-80's SWEETIE-16 palette:

### Color Palette
- **Black**: `#1a1c2c` (blue-tinted background)
- **Lime**: `#a7f070` (primary accent)
- **Cyan**: `#73eff7` (secondary accent)  
- **Yellow**: `#ffcd75` (highlights)
- **Red**: `#b13e53` (alerts/danger)
- **White**: `#f4f4f4` (text/foreground)

### CSS Classes
All components use the `t80-` prefix:
- `t80-container` - Main layout container
- `t80-button` - Interactive buttons
- `t80-nav-*` - Navigation components
- `t80-post-*` - Blog post elements

### Resolution
Designed for TIC-80's 240×136 base resolution with perfect scaling.

## ⚙️ Configuration

The main configuration is in `config.toml` with TIC-80 specific features:

```toml
[params]
  # TIC-80 Customization
  pixelPerfect = true
  enableSoundEffects = true
  showStarfield = true
```

## 🛠️ Development

### Creating Content

```bash
# New blog post with TIC-80 styling
hugo new content blog/my-post.md

# New project showcase
hugo new content projects/my-project.md
```

### TIC-80 Style Guide

Visit `/styleguide/tic80-components/` to see all available components and their usage.

### Building for Production

```bash
hugo --minify --environment production
```

## 🚧 Project Status

### ✅ Completed
- [x] TIC-80 migration from PICO-8 complete
- [x] SWEETIE-16 color palette implemented
- [x] All templates converted to `t80-` classes
- [x] Hugo layout warnings resolved
- [x] Build system working correctly
- [x] Style guide functional

### 🔄 In Progress
- [ ] README.md updates (this document)
- [ ] Comprehensive TIC-80 usage guide
- [ ] Main site content updates

### 📋 Todo
- [ ] TIC-80 themed favicon
- [ ] Custom TIC-80 badges
- [ ] Performance optimization
- [ ] Multi-browser testing

## 📚 Resources

- [TIC-80 Official](https://tic80.com/)
- [SWEETIE-16 Palette](https://lospec.com/palette-list/sweetie-16)
- [Hugo Documentation](https://gohugo.io/)
- [Project Tasks](proompts/get-next-task.md)
- [TIC-80 Design System](proompts/docs/tic80-design-system.md)

## 🎮 About TIC-80

TIC-80 is a fantasy computer for making, playing and sharing tiny games. This site celebrates its aesthetic constraints and the beautiful SWEETIE-16 palette, proving that limitations spark creativity.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*"240×136 pixels of pure creativity"* 🎮✨
