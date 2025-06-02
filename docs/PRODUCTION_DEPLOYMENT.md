# 🚀 Production Deployment Guide

## Overview
This guide covers deploying the TIC-80 themed spurlin.dev site to production, including optimization steps, deployment options, and monitoring setup.

## Pre-Deployment Checklist

### ✅ Configuration
- [ ] Hugo warnings suppressed (`ignoreLogs` configured)
- [ ] `baseURL` set to production URL in `config.toml`
- [ ] Analytics configured (if using)
- [ ] SEO metadata verified

### ✅ Assets
- [ ] Favicon files generated and tested
- [ ] Site badges created (88x31)
- [ ] 404 page styled and working
- [ ] Social media preview images created

### ✅ Performance
- [ ] Build time < 150ms
- [ ] Page load times < 1s
- [ ] CSS file size optimized
- [ ] Images optimized (if any)

### ✅ Testing
- [ ] Cross-browser testing completed
- [ ] Mobile responsiveness verified
- [ ] Accessibility audit passed
- [ ] All links verified

## Build for Production

### 1. Clean Build
```bash
# Remove old build artifacts
rm -rf public/

# Build with production settings
hugo --minify --gc

# Verify build
ls -la public/
```

### 2. Optimization Script
Create `scripts/build-production.sh`:
```bash
#!/bin/bash
echo "🎮 Building TIC-80 site for production..."

# Clean previous builds
rm -rf public/

# Build with minification
hugo --minify --gc --cleanDestinationDir

# Report build stats
echo "Build complete!"
echo "Total size: $(du -sh public/ | cut -f1)"
echo "File count: $(find public -type f | wc -l)"
```

## Deployment Options

### Option 1: Netlify (Recommended)

1. **netlify.toml** configuration:
```toml
[build]
  publish = "public"
  command = "hugo --minify --gc"

[build.environment]
  HUGO_VERSION = "0.131.0"
  HUGO_ENV = "production"

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    X-XSS-Protection = "1; mode=block"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "/css/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/img/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
```

2. Deploy:
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=public
```

### Option 2: GitHub Pages

1. **GitHub Actions** workflow (`.github/workflows/deploy.yml`):
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: true
        fetch-depth: 0

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: '0.131.0'
        extended: true

    - name: Build
      run: hugo --minify --gc

    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./public
```

### Option 3: Traditional Hosting

1. Build locally:
```bash
hugo --minify --gc
```

2. Upload `public/` directory via:
- FTP/SFTP
- rsync: `rsync -avz --delete public/ user@server:/path/to/site/`
- SCP: `scp -r public/* user@server:/path/to/site/`

## Post-Deployment Tasks

### 1. Verify Deployment
```bash
# Check site is live
curl -I https://spurlin.dev

# Test key pages
curl -s https://spurlin.dev | grep -q "TIC-80"
curl -s https://spurlin.dev/404 | grep -q "Page Not Found"
```

### 2. Performance Testing
```bash
# Lighthouse audit
npx lighthouse https://spurlin.dev --view

# PageSpeed Insights
open "https://pagespeed.web.dev/report?url=https://spurlin.dev"

# GTmetrix
open "https://gtmetrix.com"
```

### 3. Monitor Setup

#### Uptime Monitoring
- [UptimeRobot](https://uptimerobot.com/) - Free tier available
- [Pingdom](https://www.pingdom.com/) - More detailed metrics

#### Analytics (Privacy-Focused)
- [Plausible](https://plausible.io/) - GDPR compliant
- [Fathom](https://usefathom.com/) - Simple, privacy-first
- [GoatCounter](https://www.goatcounter.com/) - Open source

## Security Headers

Add to your web server configuration:

### Nginx
```nginx
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header X-XSS-Protection "1; mode=block" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Content-Security-Policy "default-src 'self'; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline';" always;
```

### Apache
```apache
Header always set X-Frame-Options "SAMEORIGIN"
Header always set X-Content-Type-Options "nosniff"
Header always set X-XSS-Protection "1; mode=block"
Header always set Referrer-Policy "strict-origin-when-cross-origin"
Header always set Content-Security-Policy "default-src 'self'; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline';"
```

## Caching Strategy

### Static Assets
- `/css/*` - 1 year cache
- `/js/*` - 1 year cache  
- `/img/*` - 1 year cache
- `/favicon/*` - 1 year cache

### HTML Pages
- Cache for 1 hour
- Use ETags for validation

## Rollback Plan

### Quick Rollback
1. Keep previous build:
```bash
cp -r public/ public.backup/
```

2. If issues arise:
```bash
rm -rf public/
mv public.backup/ public/
# Redeploy
```

### Git-based Rollback
```bash
# Find last good commit
git log --oneline

# Revert to previous version
git checkout <commit-hash>
hugo --minify --gc
# Redeploy
```

## Performance Targets

### Core Web Vitals
- **LCP** (Largest Contentful Paint): < 2.5s
- **FID** (First Input Delay): < 100ms
- **CLS** (Cumulative Layout Shift): < 0.1

### Lighthouse Scores
- Performance: > 95
- Accessibility: > 95
- Best Practices: > 95
- SEO: > 95

## Troubleshooting

### Common Issues

1. **404 on all pages except home**
   - Check web server rewrite rules
   - Ensure `public/404.html` exists

2. **Broken CSS/missing styles**
   - Verify `baseURL` in config
   - Check asset paths are relative

3. **Slow page loads**
   - Enable gzip/brotli compression
   - Check server location vs audience

4. **Hugo build fails in CI/CD**
   - Verify Hugo version matches local
   - Check theme submodule is included

## Maintenance Schedule

### Weekly
- Check uptime monitoring alerts
- Review analytics for issues
- Test critical user paths

### Monthly
- Run full Lighthouse audit
- Update dependencies
- Review and optimize slow pages

### Quarterly
- Security audit
- Performance deep-dive
- Content audit (broken links, etc.)

## Emergency Contacts

- **Domain Registrar**: [Your registrar]
- **Hosting Provider**: [Your host]
- **CDN Support**: [If using CDN]

---

**🎮 Remember**: The TIC-80 design system is optimized for performance by default. The constraint of 16 colors means smaller CSS files and faster renders! 