---
title: "Neocities Revival Theme"
date: 2024-01-15T10:00:00-05:00
draft: false
description: "A Hugo theme combining 90s web nostalgia with PICO-8 design system"
summary: "Bringing retro web aesthetics to the modern era with PICO-8's beautiful 16-color palette and pixel-perfect design philosophy."

# Project Meta
featured: true
image: "/images/projects/neocities-revival.png"
tech: ["Hugo", "SCSS", "JavaScript", "PICO-8", "CSS Grid"]
github: "https://github.com/spurlin/neocities-revival"
demo: "https://neocities-revival.netlify.app"
status: "active"

# Retro Web Styling
retro_style: "project"
pixel_perfect: true

# SEO & Social
keywords: ["Hugo theme", "PICO-8", "retro web", "90s design", "CSS"]
---

## 🎮 Project Overview

The **Neocities Revival** theme is a love letter to the early web, enhanced with the design philosophy of PICO-8's fantasy console. It combines nostalgic 90s web elements with modern web standards and accessibility.

## ✨ Key Features

### PICO-8 Design System
- Complete 16-color palette implementation
- Pixel-perfect components and typography
- Consistent 8px grid system
- Fantasy console aesthetic

### Retro Web Elements
- Animated starfield backgrounds
- Classic visitor counters
- 88x31 web badges
- Web ring navigation
- Under construction banners
- Retro sound effects

### Modern Standards
- Fully responsive design
- WCAG accessibility compliance
- Semantic HTML5 markup
- Optimized performance
- SEO-friendly structure

## 🛠️ Technical Implementation

{{< p8-code lang="scss" >}}
// PICO-8 Color Variables
:root {
  --p8-dark-blue: #1d2b53;
  --p8-dark-purple: #7e2553;
  --p8-dark-green: #008751;
  --p8-brown: #ab5236;
  --p8-dark-grey: #5f574f;
  --p8-light-grey: #c2c3c7;
  --p8-white: #fff1e8;
  --p8-red: #ff004d;
  --p8-orange: #ffa300;
  --p8-yellow: #ffec27;
  --p8-green: #00e436;
  --p8-blue: #29adff;
  --p8-indigo: #83769c;
  --p8-pink: #ff77a8;
  --p8-peach: #ffccaa;
}
{{< /p8-code >}}

### Architecture

The theme is built with a modular SCSS architecture:

- **`pico8/`** - Core design system components
- **`retro/`** - 90s web enhancement modules  
- **`layout/`** - Site structure and navigation
- **`main.scss`** - Master stylesheet orchestrator

### Hugo Integration

{{< p8-code lang="go" >}}
<!-- Hugo template example -->
{{ $style := resources.Get "scss/main.scss" | toCSS | minify }}
<link rel="stylesheet" href="{{ $style.RelPermalink }}">

{{ range .Site.RegularPages }}
  <article class="p8-post-card">
    <h3 class="p8-post-title">{{ .Title }}</h3>
    <p class="p8-post-summary">{{ .Summary }}</p>
  </article>
{{ end }}
{{< /p8-code >}}

## 🎯 Design Philosophy

### Constraints Breed Creativity

PICO-8's limitations aren't restrictions—they're creative catalysts:

- **16 colors only** - Forces thoughtful color choices
- **Low resolution** - Emphasizes clarity and simplicity  
- **Pixel aesthetic** - Celebrates digital craftsmanship
- **8px grid** - Creates consistent, harmonious layouts

### Accessibility First

Retro doesn't mean inaccessible:

- High contrast color combinations
- Semantic HTML structure
- Keyboard navigation support
- Screen reader compatibility
- Reduced motion preferences

## 🚀 Getting Started

### Installation

{{< p8-code lang="bash" >}}
# Add as Git submodule
git submodule add https://github.com/spurlin/neocities-revival.git themes/neocities-revival

# Or clone directly
git clone https://github.com/spurlin/neocities-revival.git themes/neocities-revival
{{< /p8-code >}}

### Configuration

{{< p8-code lang="toml" >}}
# config.toml
theme = "neocities-revival"

[params]
  author = "Your Name"
  description = "Welcome to my retro web!"
  visitorCount = "001337"
  pixelPerfect = true
  enableSoundEffects = true
{{< /p8-code >}}

## 🌟 Future Enhancements

- [ ] Additional retro components (marquee, blink)
- [ ] Tiled background patterns
- [ ] Guestbook integration
- [ ] More 88x31 badge collections
- [ ] PICO-8 cart embedding
- [ ] Retro cursor effects
- [ ] Matrix rain animation

## 🤝 Contributing

This project welcomes contributions! Whether you're:

- Adding new retro components
- Improving accessibility
- Creating documentation
- Reporting bugs
- Sharing feedback

Check out the [GitHub repository](https://github.com/spurlin/neocities-revival) to get involved.

## 📄 License

MIT License - Use it, modify it, share it!

---

*Built with 🎮 and lots of nostalgia* 