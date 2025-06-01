# 🎮 Neocities Revival Theme

A nostalgic 90s web aesthetic theme for Hugo with PICO-8 design system integration.

## ✨ Features

- **PICO-8 Design System**: Complete 16-color palette with pixel-perfect components
- **90s Web Nostalgia**: Web rings, visitor counters, animated GIFs, and badges
- **Responsive Design**: Modern responsive layout with retro aesthetics
- **Accessibility**: WCAG compliant with proper semantic markup
- **Performance**: Optimized CSS and minimal JavaScript
- **Dark Mode**: PICO-8 color palette works beautifully in dark themes

## 🚀 Quick Start

1. **Add the theme to your Hugo site:**
   ```bash
   git submodule add https://github.com/spurlin/neocities-revival.git themes/neocities-revival
   ```

2. **Update your `config.toml`:**
   ```toml
   theme = "neocities-revival"
   
   [params]
     author = "Your Name"
     description = "Welcome to my retro web!"
     visitorCount = "001337"
     underConstruction = false
     enableGuestbook = false
   ```

3. **Start your Hugo server:**
   ```bash
   hugo server
   ```

## 🎨 PICO-8 Design System

This theme includes a complete design system based on PICO-8's 16-color palette:

### Colors
- **Dark Blue** (`#1d2b53`) - Primary backgrounds
- **Dark Purple** (`#7e2553`) - Secondary elements
- **Dark Green** (`#008751`) - Success states
- **Brown** (`#ab5236`) - Warm accents
- **Dark Grey** (`#5f574f`) - Text on light backgrounds
- **Light Grey** (`#c2c3c7`) - Subtle elements
- **White** (`#fff1e8`) - Primary text and backgrounds
- **Red** (`#ff004d`) - Errors and alerts
- **Orange** (`#ffa300`) - Warnings
- **Yellow** (`#ffec27`) - Highlights
- **Green** (`#00e436`) - Success
- **Blue** (`#29adff`) - Links and info
- **Indigo** (`#83769c`) - Muted elements
- **Pink** (`#ff77a8`) - Playful accents
- **Peach** (`#ffccaa`) - Soft highlights

### Components

#### Buttons
```html
<a href="#" class="p8-button p8-button-primary">Primary</a>
<a href="#" class="p8-button p8-button-secondary">Secondary</a>
<a href="#" class="p8-button p8-button-outline">Outline</a>
```

#### Cards
```html
<div class="p8-card">
  <div class="p8-card-header">
    <h3 class="p8-card-title">Card Title</h3>
  </div>
  <div class="p8-card-content">
    Card content goes here.
  </div>
</div>
```

#### Info Boxes
```markdown
{{< p8-info >}}
This is an info box with PICO-8 styling!
{{< /p8-info >}}
```

#### Code Blocks
```markdown
{{< p8-code lang="javascript" >}}
console.log("Hello PICO-8 Web!");
{{< /p8-code >}}
```

## 📁 Directory Structure

```
themes/neocities-revival/
├── assets/
│   ├── scss/
│   │   ├── pico8/           # PICO-8 design system
│   │   ├── retro/           # 90s web enhancements
│   │   ├── layout/          # Layout overrides
│   │   └── main.scss        # Main stylesheet
│   ├── js/                  # JavaScript files
│   └── icons/               # Icon assets
├── layouts/
│   ├── _default/
│   │   ├── baseof.html      # Base template
│   │   ├── single.html      # Single page template
│   │   └── list.html        # List page template
│   ├── partials/
│   │   ├── head.html        # HTML head
│   │   ├── header.html      # Site header
│   │   ├── footer.html      # Site footer
│   │   └── retro-effects.html # JavaScript effects
│   ├── shortcodes/          # Hugo shortcodes
│   └── index.html           # Homepage template
├── static/
│   ├── images/
│   │   ├── backgrounds/     # Tiled backgrounds
│   │   ├── gifs/           # Animated GIFs
│   │   └── badges/         # 88x31 web badges
│   └── fonts/              # Pixel fonts
├── archetypes/
│   ├── default.md          # Default content template
│   └── blog.md             # Blog post template
└── theme.toml              # Theme metadata
```

## ⚙️ Configuration

### Site Parameters

```toml
[params]
  # Basic Info
  author = "Your Name"
  description = "Your site description"
  
  # Retro Features
  visitorCount = "001337"
  underConstruction = false
  enableGuestbook = false
  
  # PICO-8 Customization
  pixelPerfect = true
  enableSoundEffects = true
  showStarfield = true
```

### Menu Configuration

```toml
[[menu.main]]
  name = "Home"
  url = "/"
  weight = 1

[[menu.main]]
  name = "Blog"
  url = "/blog/"
  weight = 2

[[menu.main]]
  name = "Projects"
  url = "/projects/"
  weight = 3

[[menu.main]]
  name = "About"
  url = "/about/"
  weight = 4
```

## 🎯 Content Types

### Blog Posts

Create blog posts with enhanced frontmatter:

```yaml
---
title: "My Awesome Post"
date: 2024-01-15
tags: ["hugo", "pico8", "retro"]
categories: ["blog"]
featured: true
retro_style: "blog"
pixel_perfect: true
---
```

### Projects

Create project pages with tech stacks:

```yaml
---
title: "Cool Project"
date: 2024-01-15
featured: true
image: "/images/projects/cool-project.png"
tech: ["Hugo", "PICO-8", "CSS"]
---
```

## 🌟 Retro Features

### Web Rings
The theme includes web ring navigation in the footer. Customize the links in your site configuration.

### Visitor Counter
Add a retro visitor counter with the `visitorCount` parameter.

### Animated Effects
- Starfield background
- Color cycling text
- PICO-8 sound effects (optional)
- Retro animations

### 88x31 Badges
Display classic web badges in the footer. Add your own badges to `/static/images/badges/`.

## 🛠️ Development

### Building the Theme

1. Clone the repository
2. Install dependencies (if any)
3. Make your changes
4. Test with a Hugo site

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Credits

- **PICO-8** by Lexaloffle Games for the amazing color palette
- **Hugo** for the fantastic static site generator
- **90s Web Revival** community for inspiration

---

*Built with 🎮 PICO-8 Design System* 