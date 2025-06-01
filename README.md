# 🌐 Spurlin.dev - Where the 90s Web Lives On

A personal developer website that fuses 90s web nostalgia with modern development practices. Built with Hugo static site generator, this site celebrates the raw, unfiltered creativity of the early web era while maintaining modern performance and accessibility standards.

## 🚀 Quick Start

### Prerequisites

- Hugo Extended version 0.120.0+ (for SCSS support)
- Git 2.40.0+
- Node.js 18+ (for future build scripts)

### Installation

1. **Clone the repository** (if not already done):
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
   hugo server -D
   # Navigate to http://localhost:1313
   ```

## 📁 Project Structure

```
spurlin-dev/
├── archetypes/          # Content templates (blog, project)
├── assets/              # Processed by Hugo (SCSS, JS)
├── config/              # Environment-specific configs
│   ├── _default/
│   ├── development/
│   └── production/
├── content/             # All content lives here
│   ├── blog/           # Technical blog posts
│   ├── projects/       # Portfolio items
│   └── about/          # Personal pages
├── data/               # Hugo data files (JSON/YAML/TOML)
├── layouts/            # Template overrides
├── static/             # Static files (images, fonts)
│   ├── images/
│   │   ├── gifs/      # Retro GIF collection
│   │   └── badges/    # 88x31 buttons
│   └── fonts/         # Web fonts
├── themes/             # Future: neocities-revival theme
└── resources/         # Hugo generated (gitignored)
```

## ⚙️ Configuration

The main configuration is in `config.toml` with:
- Base URL set to https://spurlin.dev
- 90s-inspired features (visitor counter, web ring, guestbook)
- Custom taxonomies for retro categorization (moods, eras)
- Unsafe HTML rendering enabled for retro tricks

### Environment-Specific Configs

- `config/_default/` - Base configuration
- `config/development/` - Development overrides
- `config/production/` - Production settings

## 🎨 Theme

The site will use a custom theme called "neocities-revival" (to be developed) that captures the authentic 90s web aesthetic while maintaining modern standards.

## 🛠️ Development

### Creating Content

```bash
# New blog post
hugo new content blog/my-post.md

# New project
hugo new content projects/my-project.md
```

### Building for Production

```bash
hugo --minify --environment production
```

## 🚧 Project Status

- [x] Hugo Extended installed
- [x] Basic Hugo structure initialized
- [x] Configuration with 90s parameters
- [x] Directory structure for retro assets
- [ ] Custom theme development
- [ ] Content templates
- [ ] Asset pipeline
- [ ] CI/CD setup

## 📚 Resources

- [Hugo Documentation](https://gohugo.io/)
- [Project Vision](proompts/initial-prompt.md)
- [Task Tracking](proompts/tasks.yaml)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*"The best time to build a 90s website? Both 20 years ago and now."* 🌟
