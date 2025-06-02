# 🎨 TIC-80 Asset Creation Guide

## Overview
This guide provides instructions for creating pixel-perfect assets that comply with the TIC-80 fantasy console aesthetic and SWEETIE-16 color palette.

## SWEETIE-16 Color Palette

### Color Reference
```css
/* TIC-80 SWEETIE-16 Palette */
--t80-black:       #1a1c2c  /* 0 - Darkest */
--t80-purple:      #5d275d  /* 1 */
--t80-red:         #b13e53  /* 2 */
--t80-orange:      #ef7d57  /* 3 */
--t80-yellow:      #ffcd75  /* 4 */
--t80-bright-yellow: #ffd93d /* Alternate bright yellow */
--t80-lime:        #a7f070  /* 5 */
--t80-green:       #38b764  /* 6 */
--t80-dark-green:  #257179  /* 7 */
--t80-dark-blue:   #29366f  /* 8 */
--t80-blue:        #3b5dc9  /* 9 */
--t80-light-blue:  #41a6f6  /* 10 */
--t80-cyan:        #73eff7  /* 11 */
--t80-white:       #f4f4f4  /* 12 - Lightest */
--t80-light-gray:  #94b0c2  /* 13 */
--t80-gray:        #566c86  /* 14 */
--t80-dark-gray:   #333c57  /* 15 */
```

### Color Usage Guidelines
- **Backgrounds**: Use darker colors (#1a1c2c, #29366f, #333c57)
- **Primary Text**: Use light colors (#f4f4f4, #94b0c2)
- **Accents**: Use bright colors (#ffd93d, #a7f070, #73eff7)
- **Warnings/Errors**: Use warm colors (#b13e53, #ef7d57)
- **Success/Positive**: Use cool colors (#38b764, #41a6f6)

## Asset Types & Specifications

### 1. Favicons
**Requirements:**
- Sizes: 16x16, 32x32, 64x64, 180x180 (Apple), 192x192, 512x512
- Format: SVG (master), PNG (generated), ICO (Windows)
- Style: Pixel-perfect, no antialiasing

**Creation Process:**
```svg
<!-- favicon.svg template -->
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
  <!-- Use only rectangles for pixels -->
  <rect width="16" height="16" fill="#1a1c2c"/>
  <!-- Add pixel art here -->
  <rect x="4" y="4" width="1" height="1" fill="#ffd93d"/>
</svg>
```

### 2. Site Badges (88x31)
**Classic Web Badge Specifications:**
- Exact size: 88x31 pixels
- Border: 1px minimum
- Text: Readable at 1x scale
- Animation: Optional 2-4 frame GIF

**SVG Template:**
```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 88 31" width="88" height="31">
  <!-- Background -->
  <rect width="88" height="31" fill="#1a1c2c"/>
  <!-- Border -->
  <rect x="0" y="0" width="88" height="1" fill="#73eff7"/>
  <rect x="0" y="30" width="88" height="1" fill="#73eff7"/>
  <rect x="0" y="0" width="1" height="31" fill="#73eff7"/>
  <rect x="87" y="0" width="1" height="31" fill="#73eff7"/>
  <!-- Content here -->
</svg>
```

### 3. Navigation Icons
**Specifications:**
- Size: 16x16 or 24x24 pixels
- Style: Minimal, recognizable at small size
- States: Normal, Hover, Active

**Icon Examples:**
```svg
<!-- Home Icon 16x16 -->
<svg viewBox="0 0 16 16">
  <!-- Roof -->
  <rect x="7" y="3" width="2" height="1" fill="#f4f4f4"/>
  <rect x="6" y="4" width="4" height="1" fill="#f4f4f4"/>
  <rect x="5" y="5" width="6" height="1" fill="#f4f4f4"/>
  <rect x="4" y="6" width="8" height="1" fill="#f4f4f4"/>
  <!-- House -->
  <rect x="5" y="7" width="6" height="6" fill="#f4f4f4"/>
  <!-- Door -->
  <rect x="7" y="10" width="2" height="3" fill="#1a1c2c"/>
</svg>
```

### 4. Loading Animations
**Specifications:**
- Size: 32x32 or 64x64 pixels
- Frames: 4-8 for smooth animation
- Loop: Seamless
- Colors: Use 2-3 colors maximum

**Frame Sequence Example:**
```
Frame 1: [ ][ ][ ][ ]
Frame 2: [█][ ][ ][ ]
Frame 3: [█][█][ ][ ]
Frame 4: [█][█][█][ ]
Frame 5: [█][█][█][█]
Frame 6: [ ][█][█][█]
Frame 7: [ ][ ][█][█]
Frame 8: [ ][ ][ ][█]
```

### 5. Social Media Assets
**Open Graph Image:**
- Size: 1200x630 pixels
- Scale: Design at 8x pixel scale
- Text: Large, pixel font style
- Border: 8px (scaled from 1px)

**Twitter Card:**
- Size: 1200x600 pixels
- Similar scaling rules apply

## Creation Tools

### Recommended Software
1. **Aseprite** (Paid) - Best for pixel art
   - Built-in SWEETIE-16 palette
   - Pixel-perfect tools
   - Animation support

2. **Piskel** (Free, Web-based)
   - Simple interface
   - Good for beginners
   - Export to multiple formats

3. **GraphicsGale** (Free)
   - Windows only
   - Professional features
   - Animation support

4. **GIMP** (Free)
   - Use 1px pencil tool
   - Disable antialiasing
   - Set up SWEETIE-16 palette

### SVG Creation Tips
- Use only `<rect>` elements for pixels
- Set `shape-rendering="crispEdges"`
- Avoid transforms, use absolute positioning
- Test at multiple scales

## Pixel Art Best Practices

### 1. Grid Alignment
- Always work on pixel grid
- No sub-pixel positioning
- Integer coordinates only

### 2. Color Conservation
- Use palette colors only
- No gradients or transparency
- Dithering for texture (sparingly)

### 3. Readability
- High contrast for text
- Minimum 3px height for readable text
- 1px spacing between letters

### 4. Scaling
- Use nearest-neighbor interpolation
- Scale by integer multiples only (2x, 3x, 4x)
- CSS: `image-rendering: pixelated;`

## Asset Implementation

### HTML Integration
```html
<!-- Favicon -->
<link rel="icon" type="image/svg+xml" href="/favicon/favicon.svg">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">

<!-- Badge -->
<img src="/img/badges/spurlin-dev-badge.svg" 
     alt="spurlin.dev" 
     width="88" 
     height="31"
     style="image-rendering: pixelated;">

<!-- Pixel-perfect rendering -->
<style>
  .pixel-art {
    image-rendering: pixelated;
    image-rendering: crisp-edges;
  }
</style>
```

### CSS Sprites
For multiple small icons:
```css
.icon {
  width: 16px;
  height: 16px;
  background-image: url('/img/icons-sprite.png');
  background-size: 256px 16px; /* 16 icons */
  image-rendering: pixelated;
}

.icon-home { background-position: 0 0; }
.icon-blog { background-position: -16px 0; }
.icon-projects { background-position: -32px 0; }
```

## Quality Checklist

### Before Finalizing Any Asset:
- [ ] Uses only SWEETIE-16 colors
- [ ] Pixel-perfect (no anti-aliasing)
- [ ] Readable at intended size
- [ ] Consistent with TIC-80 aesthetic
- [ ] Optimized file size
- [ ] Tested on multiple backgrounds
- [ ] Accessibility considered (contrast)

### Testing Process:
1. View at 100% zoom
2. Test on both light/dark backgrounds
3. Check on retina displays
4. Verify in multiple browsers
5. Test print appearance (if applicable)

## Common Mistakes to Avoid

1. **Anti-aliasing**: Always disable
2. **Wrong colors**: Use color picker from palette
3. **Odd dimensions**: Stick to even numbers when possible
4. **Too detailed**: Simplify for small sizes
5. **Gradient effects**: Use dithering instead
6. **Transparency**: Use solid backgrounds

## Asset Export Settings

### PNG Export:
- Color mode: Indexed (16 colors)
- Transparency: Only if needed
- Compression: Maximum
- Metadata: Strip all

### SVG Export:
- Precision: 0 decimal places
- Minify: Yes
- Attributes: Remove defaults
- Comments: Remove

### GIF Export (Animated):
- Colors: 16 maximum
- Dithering: None
- Transparency: Single color
- Loop: Forever

## Resources

### Palette Files
- [SWEETIE-16.pal](https://lospec.com/palette-list/sweetie-16)
- [SWEETIE-16.gpl](for GIMP)
- [SWEETIE-16.ase](for Aseprite)

### References
- [TIC-80 Wiki](https://github.com/nesbox/TIC-80/wiki)
- [Pixel Art Tutorials](https://lospec.com/pixel-art-tutorials)
- [88x31 Button Collection](https://cyber.dabamos.de/88x31/)

---

**Remember**: Constraints breed creativity! The 16-color limit of TIC-80 forces thoughtful design decisions that result in cohesive, memorable assets. 