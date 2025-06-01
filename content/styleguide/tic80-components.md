---
title: "🎮 TIC-80 Design System"
subtitle: "16 colors. Infinite possibilities."
description: "A complete style guide for the TIC-80 fantasy console design system"
layout: "styleguide"
draft: false
type: "docs"
---

# 🎮 TIC-80 Design System

Welcome to the fantasy console web! This design system brings TIC-80's beautiful constraints to modern web development.

## 🌈 The Sacred 16-Color Palette

<div class="t80-grid">
  <div class="t80-card" style="background: var(--t80-black); color: var(--t80-white);">#000000 - Black</div>
  <div class="t80-card" style="background: var(--t80-dark-blue); color: var(--t80-white);">#1D2B53 - Dark Blue</div>
  <div class="t80-card" style="background: var(--t80-dark-purple); color: var(--t80-white);">#7E2553 - Dark Purple</div>
  <div class="t80-card" style="background: var(--t80-dark-green); color: var(--t80-white);">#008751 - Dark Green</div>
  <div class="t80-card" style="background: var(--t80-brown); color: var(--t80-white);">#AB5236 - Brown</div>
  <div class="t80-card" style="background: var(--t80-dark-gray); color: var(--t80-white);">#5F574F - Dark Gray</div>
  <div class="t80-card" style="background: var(--t80-light-gray); color: var(--t80-black);">#C2C3C7 - Light Gray</div>
  <div class="t80-card" style="background: var(--t80-white); color: var(--t80-black);">#FFF1E8 - White</div>
  <div class="t80-card" style="background: var(--t80-red); color: var(--t80-white);">#FF004D - Red</div>
  <div class="t80-card" style="background: var(--t80-orange); color: var(--t80-black);">#FFA300 - Orange</div>
  <div class="t80-card" style="background: var(--t80-yellow); color: var(--t80-black);">#FFEC27 - Yellow</div>
  <div class="t80-card" style="background: var(--t80-green); color: var(--t80-black);">#00E436 - Green</div>
  <div class="t80-card" style="background: var(--t80-blue); color: var(--t80-black);">#29ADFF - Blue</div>
  <div class="t80-card" style="background: var(--t80-lavender); color: var(--t80-white);">#83769C - Lavender</div>
  <div class="t80-card" style="background: var(--t80-pink); color: var(--t80-black);">#FF77A8 - Pink</div>
  <div class="t80-card" style="background: var(--t80-peach); color: var(--t80-black);">#FFCCAA - Peach</div>
</div>

## 🔤 Typography

### Headings

<h1 class="t80-heading--h1">Level 1 Heading - The Big Boss</h1>
<h2 class="t80-heading--h2">Level 2 Heading - The Champion</h2>
<h3 class="t80-heading--h3">Level 3 Heading - The Player</h3>
<h4 class="t80-heading--h4">Level 4 Heading - The NPC</h4>

### Text Variants

<p class="t80-text">This is normal TIC-80 text. Pixel-perfect and beautiful.</p>
<p class="t80-text t80-text--large">This is large text for important stuff.</p>
<p class="t80-text t80-text--small">This is small text for fine print.</p>
<p class="t80-text t80-text--muted">This is muted text for less important info.</p>
<p class="t80-text t80-text--accent">This is accent text that grabs attention!</p>
<p class="t80-text t80-text--primary">This is primary text in hacker green.</p>
<p class="t80-text t80-text--glow">This is glowing text with special effects!</p>

### ASCII Art

<pre class="t80-ascii">
  ____  ___ ____ ____       ___  
 |  _ \|_ _/ ___/ ___|____ ( _ ) 
 | |_) || | |  | |  |_____/ _ \/\
 |  __/ | | |__| |__|    | (_>  <
 |_|   |___\____\____| ___\___/\/
                      |_____|    
</pre>

<pre class="t80-ascii t80-ascii--blink">BLINKING ASCII!</pre>
<pre class="t80-ascii t80-ascii--pulse">PULSING ASCII!</pre>

### Code

Inline code: <code class="t80-code">console.log("TIC-80!")</code>

Block code:
<pre class="t80-code t80-code--block">
function tic80Magic() {
  const colors = 16;
  const pixels = "perfect";
  return `${colors} colors, ${pixels} pixels!`;
}
</pre>

## 🔘 Buttons

### Button Variants

<div class="t80-row">
  <button class="t80-btn">Default Button</button>
  <button class="t80-btn t80-btn--primary">Primary Button</button>
  <button class="t80-btn t80-btn--secondary">Secondary Button</button>
  <button class="t80-btn t80-btn--danger">Danger Button</button>
</div>

### Button Sizes

<div class="t80-row">
  <button class="t80-btn t80-btn--small">Small</button>
  <button class="t80-btn">Normal</button>
  <button class="t80-btn t80-btn--large">Large</button>
</div>

### Special Effects

<div class="t80-row">
  <button class="t80-btn t80-btn--glow">Glowing Button</button>
  <button class="t80-btn t80-btn--pulse">Pulsing Button</button>
  <button class="t80-btn" disabled>Disabled Button</button>
</div>

### Button Groups

<div class="t80-btn-group">
  <button class="t80-btn">Left</button>
  <button class="t80-btn">Center</button>
  <button class="t80-btn">Right</button>
</div>

## 📱 Cards

### Basic Card

<div class="t80-card">
  <div class="t80-card__header">Card Title</div>
  <div class="t80-card__body">
    <p>This is a basic TIC-80 card with pixel-perfect borders and authentic styling.</p>
  </div>
  <div class="t80-card__footer">
    <button class="t80-btn t80-btn--primary">Action</button>
    <button class="t80-btn">Cancel</button>
  </div>
</div>

### Card Variants

<div class="t80-stack">
  <div class="t80-card t80-card--raised">
    <div class="t80-card__header">Raised Card</div>
    <div class="t80-card__body">This card has a bigger shadow and hover effects.</div>
  </div>
  
  <div class="t80-card t80-card--glow">
    <div class="t80-card__header">Glowing Card</div>
    <div class="t80-card__body">This card glows with TIC-80 magic!</div>
  </div>
  
  <div class="t80-card t80-card--inset">
    <div class="t80-card__header">Inset Card</div>
    <div class="t80-card__body">This card appears pressed into the surface.</div>
  </div>
</div>

## 📝 Form Components

### Input Fields

<div class="t80-stack">
  <label class="t80-label">
    <span>Username:</span>
    <input type="text" class="t80-input" placeholder="Enter your username">
  </label>
  
  <label class="t80-label">
    <span>Email (Large):</span>
    <input type="email" class="t80-input t80-input--large" placeholder="your@email.com">
  </label>
  
  <label class="t80-label">
    <span>Code (Small):</span>
    <input type="text" class="t80-input t80-input--small" placeholder="ABC123">
  </label>
</div>

### Textarea

<label class="t80-label">
  <span>Message:</span>
  <textarea class="t80-textarea" placeholder="Write your TIC-80 adventure story..."></textarea>
</label>

### Select

<label class="t80-label">
  <span>Choose your character:</span>
  <select class="t80-select">
    <option>Pixel Warrior</option>
    <option>Code Wizard</option>
    <option>Bit Ninja</option>
    <option>Retro Ranger</option>
  </select>
</label>

### Checkboxes and Radios

<div class="t80-stack">
  <label class="t80-label">
    <input type="checkbox" class="t80-checkbox">
    <span>Enable pixel perfect mode</span>
  </label>
  
  <label class="t80-label">
    <input type="checkbox" class="t80-checkbox">
    <span>Use 16-color palette only</span>
  </label>
  
  <fieldset>
    <legend class="t80-text t80-text--accent">Choose your console:</legend>
    <label class="t80-label">
      <input type="radio" name="console" class="t80-radio">
      <span>TIC-80</span>
    </label>
    <label class="t80-label">
      <input type="radio" name="console" class="t80-radio">
      <span>TIC-80</span>
    </label>
    <label class="t80-label">
      <input type="radio" name="console" class="t80-radio">
      <span>Fantasy Console X</span>
    </label>
  </fieldset>
</div>

## 🧭 Navigation

<nav class="t80-nav">
  <a href="#" class="t80-nav__brand">SPURLIN.DEV</a>
  <ul class="t80-nav__links">
    <li><a href="#" class="t80-nav__link t80-nav__link--active">Home</a></li>
    <li><a href="#" class="t80-nav__link">Projects</a></li>
    <li><a href="#" class="t80-nav__link">Blog</a></li>
    <li><a href="#" class="t80-nav__link">Contact</a></li>
  </ul>
</nav>

## 📊 Data Display

### Table

<table class="t80-table">
  <thead>
    <tr>
      <th>Game</th>
      <th>Colors</th>
      <th>Resolution</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Celeste</td>
      <td>16</td>
      <td>128x128</td>
      <td><span class="t80-badge">Complete</span></td>
    </tr>
    <tr>
      <td>Dusk Child</td>
      <td>16</td>
      <td>128x128</td>
      <td><span class="t80-badge t80-badge--secondary">In Progress</span></td>
    </tr>
    <tr>
      <td>Pixel Dungeon</td>
      <td>16</td>
      <td>128x128</td>
      <td><span class="t80-badge t80-badge--danger">Cancelled</span></td>
    </tr>
  </tbody>
</table>

### Badges

<div class="t80-row">
  <span class="t80-badge">Default</span>
  <span class="t80-badge t80-badge--secondary">Secondary</span>
  <span class="t80-badge t80-badge--danger">Danger</span>
  <span class="t80-badge t80-badge--glow">Glowing!</span>
</div>

## 🎪 Layout Components

### Panels

<div class="t80-panel">
  <h3>Regular Panel</h3>
  <p>This is a standard panel for organizing content.</p>
</div>

<div class="t80-panel t80-panel--raised">
  <h3>Raised Panel</h3>
  <p>This panel appears elevated from the surface.</p>
</div>

<div class="t80-panel t80-panel--inset">
  <h3>Inset Panel</h3>
  <p>This panel appears pressed into the surface.</p>
</div>

### Layout Utilities

<div class="t80-container">
  <h3>Container</h3>
  <p>This content is in a responsive container that adapts to TIC-80 grid units.</p>
  
  <div class="t80-row">
    <div class="t80-card">Item 1</div>
    <div class="t80-card">Item 2</div>
    <div class="t80-card">Item 3</div>
  </div>
  
  <div class="t80-stack">
    <div class="t80-card">Stacked Item 1</div>
    <div class="t80-card">Stacked Item 2</div>
    <div class="t80-card">Stacked Item 3</div>
  </div>
</div>

## ✨ Special Effects

### Glowing Elements

<div class="t80-row">
  <span class="t80-text t80-glow--primary">Primary Glow</span>
  <span class="t80-text t80-glow--secondary">Secondary Glow</span>
  <span class="t80-text t80-glow--accent">Accent Glow</span>
  <span class="t80-text t80-glow--danger">Danger Glow</span>
</div>

### Animations

<div class="t80-row">
  <div class="t80-card t80-pulse--primary">Pulsing Card</div>
  <div class="t80-card t80-float">Floating Card</div>
  <div class="t80-card t80-hover-lift">Hover Lift Card</div>
</div>

<div class="t80-center">
  <span class="t80-text t80-blink t80-text--accent">BLINKING TEXT!</span>
</div>

## 🎨 Utility Classes

### Spacing

<div class="t80-stack">
  <div class="t80-panel t80-m-xs">Margin XS</div>
  <div class="t80-panel t80-m-sm">Margin SM</div>
  <div class="t80-panel t80-p-lg">Padding LG</div>
  <div class="t80-panel t80-px-xl t80-py-sm">Custom Padding</div>
</div>

### Colors

<div class="t80-row">
  <span class="t80-text-primary">Primary Text</span>
  <span class="t80-text-secondary">Secondary Text</span>
  <span class="t80-text-accent">Accent Text</span>
  <span class="t80-text-danger">Danger Text</span>
</div>

<div class="t80-row">
  <div class="t80-bg-primary t80-p-sm">Primary BG</div>
  <div class="t80-bg-secondary t80-p-sm">Secondary BG</div>
  <div class="t80-bg-accent t80-p-sm">Accent BG</div>
</div>

## 🎮 Usage Guidelines

### The TIC-80 Philosophy

1. **Embrace Constraints**: Only use the 16 sacred colors
2. **Pixel Perfect**: Everything on 8px grid
3. **No Smooth Curves**: Keep edges sharp and authentic
4. **Consistent Spacing**: Use the spacing scale religiously
5. **Meaningful Animation**: Animations should feel like TIC-80

### Code Examples

```html
<!-- Basic TIC-80 Button -->
<button class="t80-btn t80-btn--primary">Click Me!</button>

<!-- Glowing Card with Animation -->
<div class="t80-card t80-card--glow t80-pulse">
  <h3>Magic Card</h3>
  <p>This card has TIC-80 superpowers!</p>
</div>

<!-- Perfect Form -->
<form class="t80-stack">
  <label class="t80-label">
    <span>Username:</span>
    <input type="text" class="t80-input" required>
  </label>
  <button type="submit" class="t80-btn t80-btn--primary">Submit</button>
</form>
```

### SCSS Mixins

```scss
// Use TIC-80 mixins in your custom components
.my-component {
  @include t80-text();
  @include t80-border();
  @include t80-shadow();
  @include t80-hover-lift();
}

// Custom button variant
.my-special-button {
  @include t80-button();
  background: var(--t80-lavender);
  @include t80-glow(var(--t80-lavender));
}
```

---

<div class="t80-center t80-my-lg">
  <div class="t80-ascii t80-glow--primary">
    ★ WELCOME TO THE FANTASY CONSOLE WEB! ★
  </div>
</div>

*May your pixels be perfect and your colors be sacred! 🎮✨* 