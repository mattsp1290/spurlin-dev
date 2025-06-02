#!/bin/bash

echo "🎮 TIC-80 Site Performance Test 🎮"
echo "================================="
echo ""

# Check if server is running
if ! curl -s http://localhost:1314 > /dev/null; then
    echo "❌ Hugo server not running on port 1314"
    echo "Please run: hugo server --port 1314"
    exit 1
fi

echo "✅ Hugo server detected"
echo ""

# Test page load times
echo "📊 Page Load Times:"
echo "-------------------"

test_page() {
    local url=$1
    local name=$2
    local time=$(curl -o /dev/null -s -w '%{time_total}' "$url")
    echo "$name: ${time}s"
}

test_page "http://localhost:1314/" "Homepage"
test_page "http://localhost:1314/about/" "About Page"
test_page "http://localhost:1314/projects/" "Projects"
test_page "http://localhost:1314/blog/" "Blog"
test_page "http://localhost:1314/styleguide/tic80-components/" "Style Guide"

echo ""
echo "📁 Asset Sizes:"
echo "---------------"

# Check CSS file size
if [ -f "themes/neocities-revival/static/css/tic80.css" ]; then
    css_size=$(du -h themes/neocities-revival/static/css/tic80.css | cut -f1)
    echo "TIC-80 CSS: $css_size"
fi

# Check total static assets
static_size=$(du -sh static/ 2>/dev/null | cut -f1)
echo "Static assets: $static_size"

echo ""
echo "🏗️ Build Performance:"
echo "--------------------"

# Test build time
build_start=$(date +%s%N)
hugo --quiet
build_end=$(date +%s%N)
build_time=$(( ($build_end - $build_start) / 1000000 ))
echo "Build time: ${build_time}ms"

# Count pages
page_count=$(find public -name "*.html" 2>/dev/null | wc -l | tr -d ' ')
echo "Total pages: $page_count"

echo ""
echo "✨ Performance Tips:"
echo "-------------------"
echo "• Target: <100ms build time ✓"
echo "• Target: <1s page load time"
echo "• Target: <50KB CSS file size"
echo "• Target: Lighthouse score >95"

echo ""
echo "Run 'npx lighthouse http://localhost:1314' for detailed metrics" 