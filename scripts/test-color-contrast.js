#!/usr/bin/env node

// Test SWEETIE-16 palette for WCAG color contrast compliance

const SWEETIE_16 = {
    black: '#1a1c2c',
    purple: '#5d275d',
    red: '#b13e53',
    orange: '#ef7d57',
    yellow: '#ffcd75',
    lime: '#a7f070',
    green: '#38b764',
    cyan: '#257179',
    darkBlue: '#29366f',
    blue: '#3b5dc9',
    lightBlue: '#41a6f6',
    turquoise: '#73eff7',
    white: '#f4f4f4',
    lightGray: '#94b0c2',
    gray: '#566c86',
    darkGray: '#333c57'
};

// Calculate relative luminance
function getLuminance(hex) {
    const rgb = hexToRgb(hex);
    const [r, g, b] = rgb.map(val => {
        val = val / 255;
        return val <= 0.03928 ? val / 12.92 : Math.pow((val + 0.055) / 1.055, 2.4);
    });
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

// Convert hex to RGB
function hexToRgb(hex) {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? [
        parseInt(result[1], 16),
        parseInt(result[2], 16),
        parseInt(result[3], 16)
    ] : null;
}

// Calculate contrast ratio
function getContrastRatio(color1, color2) {
    const lum1 = getLuminance(color1);
    const lum2 = getLuminance(color2);
    const bright = Math.max(lum1, lum2);
    const dark = Math.min(lum1, lum2);
    return (bright + 0.05) / (dark + 0.05);
}

// Check WCAG compliance
function checkWCAG(ratio) {
    return {
        AALarge: ratio >= 3,      // Large text (18pt+)
        AA: ratio >= 4.5,         // Normal text
        AAALarge: ratio >= 4.5,   // Large text enhanced
        AAA: ratio >= 7           // Normal text enhanced
    };
}

// Test all color combinations
console.log('🎨 SWEETIE-16 Color Contrast Testing');
console.log('=====================================\n');

// Common text/background combinations
const commonCombos = [
    { fg: 'white', bg: 'black', name: 'White on Black' },
    { fg: 'black', bg: 'white', name: 'Black on White' },
    { fg: 'white', bg: 'darkBlue', name: 'White on Dark Blue' },
    { fg: 'white', bg: 'purple', name: 'White on Purple' },
    { fg: 'black', bg: 'yellow', name: 'Black on Yellow' },
    { fg: 'black', bg: 'lime', name: 'Black on Lime' },
    { fg: 'white', bg: 'red', name: 'White on Red' },
    { fg: 'white', bg: 'green', name: 'White on Green' },
    { fg: 'white', bg: 'cyan', name: 'White on Cyan' },
    { fg: 'black', bg: 'turquoise', name: 'Black on Turquoise' }
];

console.log('📊 Common Text/Background Combinations:\n');

commonCombos.forEach(({ fg, bg, name }) => {
    const ratio = getContrastRatio(SWEETIE_16[fg], SWEETIE_16[bg]);
    const wcag = checkWCAG(ratio);

    console.log(`${name}:`);
    console.log(`  Contrast Ratio: ${ratio.toFixed(2)}:1`);
    console.log(`  WCAG AA: ${wcag.AA ? '✅' : '❌'} | AAA: ${wcag.AAA ? '✅' : '❌'}`);
    console.log('');
});

// Full matrix for documentation
console.log('\n📋 Full Contrast Matrix:\n');
console.log('Generating comprehensive contrast report...\n');

let markdownReport = '# SWEETIE-16 Color Contrast Report\n\n';
markdownReport += '## Color Values\n\n';
markdownReport += '| Color | Hex | RGB |\n';
markdownReport += '|-------|-----|-----|\n';

Object.entries(SWEETIE_16).forEach(([name, hex]) => {
    const rgb = hexToRgb(hex);
    markdownReport += `| ${name} | ${hex} | rgb(${rgb.join(', ')}) |\n`;
});

markdownReport += '\n## Contrast Ratios\n\n';
markdownReport += '| Foreground | Background | Ratio | AA | AAA |\n';
markdownReport += '|------------|------------|-------|----|----||\n';

let passCount = 0;
let totalCount = 0;

Object.entries(SWEETIE_16).forEach(([fgName, fgHex]) => {
    Object.entries(SWEETIE_16).forEach(([bgName, bgHex]) => {
        if (fgName !== bgName) {
            const ratio = getContrastRatio(fgHex, bgHex);
            const wcag = checkWCAG(ratio);

            if (wcag.AA) {
                passCount++;
                markdownReport += `| ${fgName} | ${bgName} | ${ratio.toFixed(2)} | ✅ | ${wcag.AAA ? '✅' : '❌'} |\n`;
            }
            totalCount++;
        }
    });
});

markdownReport += `\n## Summary\n\n`;
markdownReport += `- Total color combinations: ${totalCount}\n`;
markdownReport += `- WCAG AA compliant: ${passCount} (${((passCount / totalCount) * 100).toFixed(1)}%)\n`;
markdownReport += `- Recommended for text: Use high contrast combinations marked with ✅\n`;

// Save report
const fs = require('fs');
const path = require('path');

const reportPath = path.join(__dirname, '..', 'docs', 'test-results', 'sweetie16-contrast-report.md');
fs.writeFileSync(reportPath, markdownReport);

console.log(`\n✅ Contrast report saved to: ${reportPath}`);
console.log(`\n📊 Summary: ${passCount}/${totalCount} combinations pass WCAG AA`);

// Recommendations
console.log('\n🎯 Recommendations:');
console.log('- Primary text: White on Black/DarkBlue/Purple');
console.log('- Highlighted text: Black on Yellow/Lime');
console.log('- Error states: White on Red');
console.log('- Success states: White on Green or Black on Lime');
console.log('- Links: LightBlue on Black background'); 